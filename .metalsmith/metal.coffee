#
# # Metal
#
# Our metalsmith build code.
#
path        = require 'path'
metalsmith  = require 'metalsmith'
collections = require 'metalsmith-collections'
markdown    = require 'metalsmith-markdown'
permalinks  = require 'metalsmith-permalinks'
templates   = require 'metalsmith-templates'
paginate    = require './plugins/paginate'



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
    .ignore ['.git', '.metalsmith', 'legacy']
    .options remove: false
    .use markdown()
    .use templates 'toffee'
    .use collections
      faq:
        pattern: 'faq/*.md'
        sortBy: 'date'
    .use paginate
      collection: 'faq'
      limit: 10
      output: 'faq/index'
      metadata: template: 'faq.toffee'
    .use permalinks()
    .build callback



# If this file is executed directly, run the build script.
if require.main is module then build()
