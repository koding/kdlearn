#
# # Default Meta
#
clone = require 'clone'




module.exports = (opts={}) ->
  opts.collectionKey ?= 'collections'

  if not opts.collection?
    throw new Error 'defaultMeta() requires `collection` value'

  if not opts.metadata?
    throw new Error 'defaultMeta() requires `metadata` value'

  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()
    cols     = metadata[opts.collectionKey]
    col      = cols?[opts.collection]

    if not cols?
      console.warn "The collectionKey '#{opts.collectionKey}
        is not found in metalsmith metadata."
      return done()

    if not col?
      console.warn "collection '#{opts.collection}' not found."
      return done()

    # Currently not cloning any values. Feature to come, if wanted.
    file[key] ?= val for key,val of opts.metadata for file in col
    done()
