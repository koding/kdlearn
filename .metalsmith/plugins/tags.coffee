#
# # Tags
#
# Take the `tags` metadata and turn it into collection objects.
#
# Two objects are producted with this plugin:
#
# 1. tags
# 2. tagsByUnique
#
# `tags` is a collection where key is the tag name, and the value is
# a list of all files with that tag.
#
# `tagsByUnique` is a collection where key is the tag name, and value
# is a list of files with that tag, **but** each file only shows up
# once in the *entire collection*.
#




module.exports = (opts={}) ->
  opts.metaKey        ?= 'tags'
  opts.sort           ?= 'date'
  opts.reverse        ?= false
  # Unique Limit is the maximum size of a tagsByUnique list.
  # Example:
  #
  # Take a guide like: guide{tags: [nodejs, js]}
  # When this guide is added to the tags and tagsByUnique list, if
  # the tagsByUnique['nodejs'] list is already at 5 size, but this
  # guide is added to that list anyway, then it's that guide will
  # not be seen on the rendered page (since the page only displays
  # 5 from each unique tag list). With this option however,
  # this guide will instead be assigned to the `js` list, if it
  # is less than 5. If both lists are larger than 5, well then
  # it won't be seen anywhere.
  opts.uniqueMax ?= 5

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

      uniqueSet = false
      for tag, i in file[opts.metaKey]
        if typeof tag isnt 'string'
          console.warn "The tag '#{tag}' for #{filename} is not a string.
            It is being ignored."
          continue
        tag = tag.toLowerCase()
        tag = tag.replace(/\s+/, "-") 
        tags[tag] ?= []
        tags[tag].push file
        # For the tagsByUnique list, only push this file once.
        # Note that this also only pushes the first tag
        # listed in the file's tag list, which is a good thing.
        # Example being, file[nodejs, javascript] will push to
        # nodejs first, and not javascript. Allows you to
        # prioritize the list.
        tagsByUnique[tag] ?= []
        if not uniqueSet and tagsByUnique[tag].length < opts.uniqueMax
          tagsByUnique[tag].push file
          uniqueSet = true

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
