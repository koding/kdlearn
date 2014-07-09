#
# # Authors
#
# The authors plugin will collect all of the authors and create a new page
# with the author data exposed.
#
each    = require('async').eachSeries
newPage = require './new-page'



module.exports = (opts={}) ->
  opts.metadata ?= {}
  (files, metalsmith, done) ->
    authors = {}
    for filename,file of files
      if not file.author? then continue

      slug = file.username ? file.author.toLowerCase().replace /\W+/g, ''

      if authors[slug]?
        author = authors[slug]
      else
        author = authors[slug] =
          name:      file.author
          slug:      slug
          username:  file.username
          guides:    []

      author.guides.push file

    # Iterate over the authors, creating each of their pages.
    each Object.keys(authors), (slug, next) ->
      authorOpts =
        output: "authors/#{slug}"
        metadata:
          author: authors[slug]
          template: 'author.toffee'
      # See awkward func call explanation below
      newPage(authorOpts) files, metalsmith, next

    opts.metadata.authors = authors
    opts.metadata.template ?= 'authors.toffee'
    opts.output = 'authors'
    # The newPage call is a plugin, effectively to Middleware. This means it
    # is designed as a function to return a function. So, first we call
    # the middleware with opts, then we call the returned function
    newPage(opts) files, metalsmith, done
