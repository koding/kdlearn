#
# # Snapshot Contents
#
# Add a key to a file's metadata which is a copy of the `contents` value
# at that point in time. Files are matched by collection.
#
# ## Why?
#
# The `contents` metadata is intended to be very mutable. Plugins change it,
# such as rendering markdown or running it through a templating language,
# and after that you cannot access the original data.
#




module.exports = (opts={}) ->
  opts.name ?= 'snapshot'
  (files, metalsmith, done) ->
    if opts.collection?
      collections = metalsmith.metadata().collections
      if not collections?
        return console.warn 'snapshot should be run after collections()
          when using the `collection` option.'
      snapshots = collections[opts.collection]
    else
      snapshots = (v for k,v of files)

    snapshot[opts.name] = snapshot.contents for snapshot in snapshots
    done()
