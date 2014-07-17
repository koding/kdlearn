#
# # Metal
#
# Our metalsmith build code.
#
path         = require 'path'
highlightjs  = require 'highlight.js'
metalsmith   = require 'metalsmith'
collections  = require 'metalsmith-collections'
excerpts     = require 'metalsmith-excerpts'
ignore       = require 'metalsmith-ignore'
markdown     = require 'metalsmith-markdown'
metadata     = require 'metalsmith-metadata'
permalinks   = require 'metalsmith-permalinks'
templates    = require 'metalsmith-templates'
authors      = require './plugins/authors'
defaultMeta  = require './plugins/defaultmeta'
descMeta     = require './plugins/descriptionMeta'
paginate     = require './plugins/paginate'
paginateTags = require './plugins/paginatetags'
moment       = require './plugins/moment'
feed         = require './plugins/feed'
filename     = require './plugins/filename'
newPage      = require './plugins/new-page'
series       = require './plugins/series'
snapshot     = require './plugins/snapshot'
tags         = require './plugins/tags'
titleify     = require './plugins/titleify'
videoScraper = require './plugins/video-scraper'


# Configure highlightjs with some language aliases
highlightjs.registerLanguage 'coffee', (hljs) ->
  hljs.getLanguage('coffeescript')


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
    # Ignore files from ever entering the stream
    .ignore ['.agignore', '.gitignore', '.git', '.metalsmith', 'legacy']
    .options remove: false
    # Place before the ignore plugin that removes non-markdown
    # from the stream
    .use metadata
      tagNames: 'categories.yaml'
    # Remove files from the stream
    .use ignore [
      '**/*'
      '!**/*.md'
      ]
    .use markdown
      langPrefix: ''
      highlight: (code, lang) ->
        lang = [lang] if lang?
        highlightjs.highlightAuto(code, lang).value
    .use excerpts()
    .use titleify()
    .use moment()
    .use series()
    .use collections
      faq:
        pattern: 'faq/*.html'
        sortBy: 'importance'
      guide: 
        pattern: 'guides/**/*.html'
        sortBy: 'date'
        reverse: true
    .use defaultMeta
      collection: 'faq'
      metadata: template: 'faq.toffee'
    .use defaultMeta
      collection: 'guide'
      metadata: template: 'page.toffee'
    .use tags
      metaKey: 'categories'
      sort: 'date'
      reverse: true
    .use videoScraper
      collection: 'video'
      key: 'videoId'
    .use authors()
    .use newPage
      output: 'index'
      metadata: template: 'index.toffee'
    .use newPage
      output: 'search'
      metadata: template: 'search.toffee'
    .use snapshot collection: 'faq'
    .use snapshot collection: 'guide'
    .use paginateTags
      collectionSource: 'tags'
      limit: 10
      output: 'categories'
      metadata: template: 'tag.toffee'
    .use paginate
      collection: 'faq'
      limit: 10
      output: 'faq'
      metadata: template: 'faqs.toffee'
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
    .use descMeta() # Add Description Metatag to each Document
    .use feed
      collections: ['guide', 'faq']
      output: 'rss.xml'
      metadata: template: 'feed.toffee'
    # foo
    .use feed
      collections: ['guide', 'faq']
      output: 'sitemap.xml'
      metadata: template: 'sitemap.toffee'
    .use templates 'toffee'
    .build callback



# If this file is executed directly, run the build script.
if require.main is module then build()
