#
# # Default Meta
#
clone = require 'clone'




module.exports = (opts={}) ->
  opts.collectionKey ?= 'collections'
  opts.clone ?= false

  if not opts.metadata?
    throw new Error 'defaultMeta() requires `metadata` value'

  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()

    # Get the file list we're going to work on, `targetFiles`
    if opts.collection?
      # If collection is defined, use the collection as the targetFiles
      cols     = metadata[opts.collectionKey]
      col      = cols?[opts.collection]

      if not cols?
        console.warn "The collectionKey '#{opts.collectionKey}
          is not found in metalsmith metadata."
        return done()

      if not col?
        console.warn "collection '#{opts.collection}' not found."
        return done()

      targetFiles = col
    else
      # If no collection is defined, use all of the files.
      targetFiles = []
      targetFiles.push file for filename, file of files

    # Now that we have our target files, add the new meta
    for file in targetFiles
      for key,val of opts.metadata
        val = clone val if opts.clone
        file[key] ?= val
    done()
