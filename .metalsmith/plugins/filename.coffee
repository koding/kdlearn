#
# # Filename
#
path = require 'path'




linkify = (p) ->
  name = path.basename(p).split('.')[0]
  if name is 'index' then path.join '/', path.dirname p
  else p


module.exports = (opts={}) ->
  (files, metalsmith, done) ->
    for name,file of files
      file.files    = files
      file.filename = name
      file.httplink = linkify name
    done()
