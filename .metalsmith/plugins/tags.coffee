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
    # The full list of tags
    metadata.tags ?= {}
    # Only store each file, once.
    metadata.tagsByUnique ?= {}
    {tags}          = metadata
    {tagsByUnique}  = metadata

    # Go through each file, pulling the tag list from it
    for filename, file of files
      if not file[opts.metaKey]? then continue

      if not (file[opts.metaKey] instanceof Array)
        console.warn "The metadata key #{opts.metaKey} requires a list
          of strings but got #{JSON.stringify file[opts.metaKey]} instead."
        continue

      for tag, i in file[opts.metaKey]
        if typeof tag isnt 'string'
          console.warn "The tag '#{tag}' for #{filename} is not a string.
            It is being ignored."
          continue
        tag = tag.toLowerCase()
        tags[tag] ?= []
        tags[tag].push file
        # For the tagsByUnique list, only push this file once.
        # Note that this also only pushes the first tag
        # listed in the file's tag list, which is a good thing.
        # Example being, file[nodejs, javascript] will push to
        # nodejs first, and not javascript. Allows you to
        # prioritize the list.
        if i is 0
          tagsByUnique[tag] ?= []
          tagsByUnique[tag].push file

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
