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
    metadata = metalsmith.metadata()
    tags     = metadata[opts.collectionSource]
    tagNames = metadata.tagNames

    if not tags
      console.warn "collectionSource '#{opts.collectionSource}' not found in
        paginateTags plugin."
      return done()

    tagKeys = Object.keys tags
    do next = (index=0) ->
      if not tagKeys[index]? then return done()
      tagKey = tagKeys[index]
      tag     = tags[tagKey]
      fn = paginate
        collection: tagKey
        collectionSource: 'tags'
        limit: 10
        output: "#{opts.output}/#{tagKey}"
        metadata:
          tagKey: tagKey
          tagName: tagNames[tagKey]
          template: 'tag.toffee'
      fn files, metalsmith, -> next ++index
