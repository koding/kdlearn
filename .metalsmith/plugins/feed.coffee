#
# # Create Feed
#
# Create a feed page
#
clone = require 'clone'




module.exports = (opts={}) ->
  opts.metadata ?= {}
  if not opts.output?
    console.warn 'feed requires output filename'
    return done()

  (files, metalsmith, done) ->
    page          = clone opts.metadata
    page.contents ?= new Buffer('')
    page.mode     ?= '0664'
    page.files    = files

    files[opts.output] = page
    done()
