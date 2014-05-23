#
# # Metal
#
# Our metalsmith build code.
#
path         = require 'path'
metalsmith   = require 'metalsmith'
collections  = require 'metalsmith-collections'
excerpts     = require 'metalsmith-excerpts'
markdown     = require 'metalsmith-markdown'
permalinks   = require 'metalsmith-permalinks'
templates    = require 'metalsmith-templates'
paginate     = require './plugins/paginate'
moment       = require './plugins/moment'
newPage      = require './plugins/new-page'
videoScraper = require './plugins/video-scraper'



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
    .use excerpts()
    .use moment()
    .use collections
      faq:
        pattern: 'faq/*.html'
        sortBy: 'importance'
      guide: 
        pattern: 'guides/*.html'
        sortBy: 'date'
    .use videoScraper
      collection: 'video'
      key: 'videoId'
    .use newPage
      output: 'index'
      metadata: template: 'index.toffee'
    .use paginate
      collection: 'faq'
      limit: 10
      output: 'faq'
      metadata: template: 'faq.toffee'
    .use paginate
      collection: 'video'
      limit: 30
      output: 'videos'
      metadata: template: 'videos.toffee'
    .use paginate
      collection: 'guide'
      output: 'guides'
      metadata: template: 'guides.toffee'
    .use permalinks()
    .use templates 'toffee'
    .build callback



# If this file is executed directly, run the build script.
if require.main is module then build()
