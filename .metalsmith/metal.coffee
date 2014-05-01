#
# # Metal
#
# Our metalsmith build code.
#
path       = require 'path'
metalsmith = require 'metalsmith'
markdown   = require 'metalsmith-markdown'
templates  = require 'metalsmith-templates'



# ## build
#
# Build our metalsmith project. Exported as a module.
#
# - callback(err, files): A function which is given an error
#   or a list of files when metalsmith is done.
module.exports = build = (callback=->) ->
  metalsmith __dirname
    .source '..'
    .destination 'build'
    .ignore ['.git', '.metalsmith']
    .use markdown()
    .use templates 'toffee'
    .build callback



# If this file is executed directly, run the build script.
if require.main is module then build()
