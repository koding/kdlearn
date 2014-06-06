#
# # Tags
#
# Take the `tags` metadata and turn it into collection objects.
#




module.exports = (opts={}) ->
  opts.metaKey ?= 'tags'

  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()
    metadata.tags ?= {}
    {tags} = metalsmith.metadata()

    for filename, file of files
      if not file[opts.metaKey]? then continue

      if not (file[opts.metaKey] instanceof Array)
        console.warn "The metadata key #{opts.metaKey} requires a list
          of strings but got #{JSON.stringify file[opts.metaKey]} instead."
        continue

      for tag in file[opts.metaKey]
        tags[tag] ?= []
        tags[tag].push file
    done()
