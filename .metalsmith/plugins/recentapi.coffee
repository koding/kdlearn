#
# # Recent API
#
# The recent api bakes the following json API endpoints:
#
#     /api/recent/<count>.json
#     /api/recent/<tag>/<count>.json
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
path = require 'path'



newFile = (files, uri, content) ->
  page          = {}
  page.output   = uri
  page.contents = new Buffer content
  page.mode     = '0664'
  files[page.output] = page
  null

printableFile = (file, opts={}) ->
  opts.baseHttp ?= "https://learn.koding.com/"
  file =
    title:        file.title
    url:          [opts.baseHttp, file.filename].join ""
    author:       file.author.name
    #author:
    #  name:      file.author.name
    #  username:  file.author.username
    date:         file.date

sortByKey = (sortKey) -> (a,b) ->
  return 1 if a[sortKey] < b[sortKey]
  return -1  if a[sortKey] > b[sortKey]
  return 0

module.exports = (opts={}) ->
  opts.counts = [10]

  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()
    # The full list of tags
    {tags} = metadata
    guides = metadata.collections.guide ? []

    # Create /api/recent/<count>.json
    api = {}
    for count in opts.counts
      cApi = api[count] ?= []
      for guide in guides
        cApi.push printableFile guide, opts
      # Sort the cApi list by the recentType key value
      cApi.sort sortByKey "date"
      api[count] = cApi[0...count]

    # Now add our plain count apis
    for count, json of api
      newFile files, "api/recent/#{count}.json",
        #JSON.stringify json
        # Temporarily pretty formatted
        JSON.stringify json, null, 2

    # Create /api/recent/<tag>/<count>.json
    api = {}
    for tagName, tFiles of tags
      tApi = api[tagName] ?= {}
      for count in opts.counts
        cApi = tApi[count] ?= []
        for file in tFiles
          cApi.push printableFile file, opts
        # Sort the cApi list by the recentType key value
        cApi.sort sortByKey "date"
        tApi[count] = cApi[0...count]

    # Now add the tag api to the files object
    for tagName, tApi of api
      for count, json of tApi
        newFile files, "api/recent/#{tagName}/#{count}.json",
          #JSON.stringify json
          # Temporarily pretty formatted
          JSON.stringify json, null, 2

    done()
