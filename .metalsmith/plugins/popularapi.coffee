#
# # Recent API
#
# The recent api bakes the following json API endpoints:
#
#     /api/popular/<count>.json
#     /api/popular/<tag>/<count>.json
#
# The following arguments are supported:
#
#     <count>
#       Limited to X guides, where X by default is:
#         - 10
#     <tag>
#       All existing tags
#
# TODO: Unify recentapi & popular api codebases
#
path      = require 'path'
google    = require 'googleapis'
analytics = google.analytics 'v3'



# Load secrets from the home directory
secrets = require(path.join process.env.HOME, ".kdlearn", "secret_config.json").analytics


# Create a new file in the files object.
newFile = (files, uri, content) ->
  page          = {}
  page.output   = uri
  page.contents = new Buffer content
  page.mode     = '0664'
  files[page.output] = page
  null

# Return an api friendly representation of a file
printableFile = (file, opts={}) ->
  opts.baseHttp ?= "http://learn.koding.com/"
  file =
    title:        file.title
    url:          [opts.baseHttp, file.filename].join ""
    author:       file.author.name
    #author:
    #  name:      file.author.name
    #  username:  file.author.username
    date:         file.date

# Return a sort function that sorts two objects by a key.
sortByKey = (sortKey) -> (a,b) ->
  return 1 if a[sortKey] < b[sortKey]
  return -1  if a[sortKey] > b[sortKey]
  return 0


# Query Google Analytics and callback with there response
queryAnalytics = (opts={}, callback) ->
  authClient = new google.auth.JWT(
    secrets.email,
    path.join(process.env.HOME, ".kdlearn", secrets["key-file"]),
    secrets.key,
    ['https://www.googleapis.com/auth/analytics.readonly']
  )

  authClient.authorize (err, tokens) ->
    # Bail on any errors
    if err? then return callback err, tokens

    analytics.data.ga.get
      auth: authClient
      "ids":"ga:#{secrets.id}",
      "start-date":"2015-01-29",
      "end-date":"2015-02-12",
      "metrics":"ga:pageViews",
      "dimensions":"ga:pagePath",
      "sort":"-ga:pageViews",
      "max-results":"25"
      (err, result) ->
        if err? then return callback err, result, tokens
        callback null, result.rows ? []


# Query Google Analytics for Page Views and add the
# returned values to the files.
addPageViews = (files, opts={}, callback) ->
  if typeof opts is 'function'
    callback = opts
    opts = {}

  queryAnalytics null, (err, rows) ->
    if err?
      console.log "[Warning] Google Authorization Failed!"
      console.log "[Warning] Auth Debug:", arguments
      return callback err, rows

    # Convery rows to an object (key/value) for easy lookup
    pageViews = {}
    for row in rows
      [page, views] = row
      # Skip if not a /guides/ page
      continue if page[0...8] != '/guides/'
      page += 'index.html'
      pageViews[page] = parseInt(views)

    # Now loop through all files, adding page ranks as they exist,
    # and defaulting to zero if they don't.
    for filename, file of files
      filename = "/#{filename}" if filename[0] != "/"
      if pageViews[filename]?
        file.pageViews = pageViews[filename]
        # If the rows list is especially large, we should probably delete
        # the items after use. For now though, not worrying about that.
        #delete pageViews[filename]
      else
        file.pageViews = 0
    callback null


addApiFiles = (files, metalsmith, opts={}, callback) ->
  metadata = metalsmith.metadata()
  # The full list of tags
  {tags} = metadata
  guides = metadata.collections.guide ? []

  # Create /api/popular/<count>.json
  api = {}
  for count in opts.counts
    cApi = guides[..]
    cApi.sort sortByKey "pageViews"
    cApi = api[count] = cApi[0...count]
    for guide, i in cApi
      cApi[i] = printableFile guide, opts

  # Now add our plain count apis
  for count, json of api
    newFile files, "api/popular/#{count}.json",
      #JSON.stringify json
      # Temporarily pretty formatted
      JSON.stringify json, null, 2

  # Create /api/popular/<tag>/<count>.json
  api = {}
  for tagName, tGuides of tags
    tApi = api[tagName] ?= {}
    for count in opts.counts
      cApi = tGuides[..]
      cApi.sort sortByKey "pageViews"
      cApi = tApi[count] = cApi[0...count]
      for guide, i in cApi
        cApi[i] = printableFile guide, opts

  # Now add the tag api to the files object
  for tagName, tApi of api
    for count, json of tApi
      newFile files, "api/popular/#{tagName}/#{count}.json",
        #JSON.stringify json
        # Temporarily pretty formatted
        JSON.stringify json, null, 2

  callback()


module.exports = (opts={}) ->
  opts.counts = [10]

  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()
    # The full list of tags
    {tags} = metadata
    guides = metadata.collections.guide ? []

    addPageViews files, null, (err) ->
      if err? then return done()
      addApiFiles files, metalsmith, opts, -> done()

