#
# # Paginate Tags
#
# Rather than creating paginates manually on the tags, this plugin
# automatically paginates all tags found.
#
paginate = require './paginate'



module.exports = (opts={}) ->
  opts.limit            ?= 10
  opts.collectionSource ?= 'tags'

  (files, metalsmith, done) ->
    tags = metalsmith.metadata()[opts.collectionSource]

    if not tags
      console.warn "collectionSource '#{opts.collectionSource}' not found in
        paginateTags plugin."
      return done()

    tagNames = Object.keys tags
    do next = (index=0) ->
      if not tagNames[index]? then return done()
      tagName = tagNames[index]
      tag     = tags[tagName]
      fn = paginate
        collection: tagName
        collectionSource: 'tags'
        limit: 10
        output: "#{opts.output}/#{tagName}"
        metadata: template: 'tag.toffee'
      fn files, metalsmith, -> next ++index
