#
# # Create Feed
#
# Create a feed page
#
clone        = require 'clone'
sanitizeHtml = require 'sanitize-html'




module.exports = (opts={}) ->
  opts.collections ?= []
  opts.metadata    ?= {}

  if opts.collection? then opts.collections.push opts.collection

  if not opts.output?
    console.warn 'feed requires output filename'
    return done()

  items = []

  # When given a file, create a RSS Item object.
  processItem = (file) ->
    items.push
      link:         file.httplink
      guid:         file.httplink
      pubDate:      file.date
      author:       file.author ? 'Koding'
      title:        file.title
      description:  sanitizeHtml file.contents.toString(),
        allowedTags: []

  (files, metalsmith, done) ->
    collections = metalsmith.metadata().collections
    if files[opts.output]?
      console.warn "feed cannot write to file '#{opts.output}', already exists"
      return done()

    processItem f for f in collections[c] for c in opts.collections
    page          = clone opts.metadata
    page.items    = items
    page.contents ?= new Buffer ''
    page.mode     ?= '0664'

    files[opts.output] = page
    done()
