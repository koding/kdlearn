#
# # Authors
#
# The authors plugin will collect all of the authors and create a new page
# with the author data exposed.
#
newPage = require './new-page'




module.exports = (opts={}) ->
  opts.metadata ?= {}
  (files, metalsmith, done) ->
    authorNames = []
    authors     = []
    for filename,file of files
      if not file.author? then continue

      # Don't duplicate entries
      authorIndex = file.author.toLowerCase()
      if authorNames.indexOf(authorIndex) isnt -1 then continue
      authorNames.push authorIndex

      author          = {}
      author.name     = file.author
      author.username = file.username
      authors.push     author

    # Use the newPage plugin to create our page
    opts.metadata.authors = authors
    opts.metadata.template ?= 'authors.toffee'
    opts.output = 'authors'
    newPage = newPage opts
    newPage files, metalsmith, done
