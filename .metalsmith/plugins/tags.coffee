#
# # Tags
#
# Take the `tags` metadata and turn it into collection objects.
#




module.exports = (opts={}) ->
  opts.metaKey ?= 'tags'
  opts.sort    ?= 'date'
  opts.reverse ?= false

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
        if typeof tag isnt 'string'
          console.warn "The tag '#{tag}' for #{filename} is not a string.
            It is being ignored."
          continue
        tag = tag.toLowerCase()
        tags[tag] ?= []
        tags[tag].push file

    for tagName,tag of tags
      if typeof opts.sort is 'function' then tag.sort opts.sort
      else tag.sort (a, b) ->
        a = a[opts.sort]
        b = b[opts.sort]
        return 0  if not a and not b
        return -1 if not a
        return 1  if not b
        return -1 if b > a
        return 1  if a > b
        return 0
      if opts.reverse then tag.reverse()
    done()
