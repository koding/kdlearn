#
# # Description Meta
#
# If the guide has not defined a meta description, this plugin will use its
# excerpt. If that doesn't exist, it will use a fallback.
#
{extname} = require 'path'
sanitize  = require 'sanitize-html'




module.exports = (opts={}) ->
  opts.default = "
  Koding is a feature rich cloud-based development environment complete
  with free VMs, an attractive IDE and sudo level terminal access. Your
  ideal software development playground!
  "

  (files, metalsmith, done) ->
    for filename, file of files
      continue if file.description?
      continue if extname(filename) isnt '.html'
      if file.excerpt?
        # Excerpts are html, and we don't want that for the description. So
        # we're ripping that out manually.
        file.description = sanitize file.excerpt,
          allowedTags: []
      else
        file.description = opts.default
    done()
