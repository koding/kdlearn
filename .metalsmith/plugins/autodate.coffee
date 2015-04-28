#
# # Autodate
#
# Automatically apply the Unix modified timestamp into the `date`
# variable if not present.
#


###
# @param {Object} opts
# @param {Boolean} opts.replaceAll If true, Replace all of the `date`
#   values. If false, add `date` values only if it is null.
# @param {Boolean} opts.trimTime Remove the hours/minutes/etc from time
#   values if they exist. This is useful to avoid the exact modified time,
#   which might be just seconds ago.
###
module.exports = (opts={}) ->
  opts.replaceAll ?= false
  opts.trimTime   ?= true
  (files, metalsmith, done) ->
    for _, file of files
      if not file.date? or opts.replaceAll is true
        file.date = new Date file.stats.mtime
        if opts.trimTime is true
          file.date.setHours 0,0,0,0
    done()


