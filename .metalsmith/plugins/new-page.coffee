#
# # New Page
#
# Create a new page, and include 
#
path  = require 'path'
clone = require 'clone'




module.exports = (opts={}) ->
  opts.collections ?= []
  opts.metadata    ?= {}
  if not opts.output?
    return console.warn 'new-page requires output filename'

  if path.extname(opts.output) is '' then opts.output += '.html'

  (files, metalsmith, done) ->
    if files[opts.output]?
      console.warn "new-page unable to create page '#{opts.output}',
        it already exists."
      return done()

    collections = metalsmith.metadata().collections
    if not collections?
      return console.warn 'new-page should be run after collections()'

    page = opts.metadata
    page.contents ?= new Buffer('')
    page.mode     ?= '0664'
    page.name      = opts.output

    files[opts.output] = page
    done()
