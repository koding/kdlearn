#
# # Autodate
#
# Automatically apply the Unix modified timestamp into the `date`
# variable if not present.
#


module.exports = (opts={}) ->
  opts.trimTime   ?= true
  (files, metalsmith, done) ->
    for _, file of files
      if not file.date? or opts.replaceAll is true
        file.date = new Date file.stats.mtime
        if opts.trimTime is true
          file.date.setHours 0,0,0,0
    done()


