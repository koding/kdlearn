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
feed         = require './plugins/feed'
filename     = require './plugins/filename'
newPage      = require './plugins/new-page'
series       = require './plugins/series'
snapshot     = require './plugins/snapshot'
tags         = require './plugins/tags'
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
    .ignore ['.agignore', '.gitignore', '.git', '.metalsmith', 'legacy']
    .options remove: false
    .use markdown()
    .use excerpts()
    .use moment()
    .use series()
    .use collections
      faq:
        pattern: 'faq/*.html'
        sortBy: 'importance'
      guide: 
        pattern: 'guides/*.html'
        sortBy: 'date'
    .use tags metaKey: 'categories'
    .use videoScraper
      collection: 'video'
      key: 'videoId'
    .use newPage
      output: 'index'
      metadata: template: 'index.toffee'
    .use newPage
      output: 'search'
      metadata: template: 'search.toffee'
    .use snapshot collection: 'faq'
    .use snapshot collection: 'guide'
    .use paginate
      collection: 'koding'
      collectionSource: 'tags'
      limit: 10
      output: 'categories/koding'
      metadata: template: 'tag.toffee'
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
    .use filename()
    .use feed
      collections: ['guide', 'faq']
      output: 'feed.xml'
      metadata: template: 'feed.toffee'
    .use templates 'toffee'
    .build callback



# If this file is executed directly, run the build script.
if require.main is module then build()
