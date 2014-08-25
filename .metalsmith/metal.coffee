#
# # Metal
#
# Our metalsmith build code.
#
path         = require 'path'
highlightjs  = require 'highlight.js'
marked = require 'marked'
metalsmith   = require 'metalsmith'
collections  = require 'metalsmith-collections'
excerpts     = require 'metalsmith-excerpts'
ignore       = require 'metalsmith-ignore'
markdown     = require 'metalsmith-markdown'
metadata     = require 'metalsmith-metadata'
permalinks   = require 'metalsmith-permalinks'
templates    = require 'metalsmith-templates'
aboutSchema  = require './plugins/about-schema'
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


# Create a renderer instance which we'll use to modify the output of
# the markdown.
markedRenderer = new marked.Renderer()
markedRenderer.heading = (text, level) ->
  #  var escapedText = text.toLowerCase().replace(/[^\w]+/g, '-');
  #
  #  return '<h' + level + '><a name="' +
  #                escapedText +
  #                 '" class="anchor" href="#' +
  #                 escapedText +
  #                 '"><span class="header-link"></span></a>' +
  #                  text + '</h' + level + '>';
  link = text.toLowerCase().replace /[^\w]+/g, '-'
  "
  <h#{level} class='heading'>
    <a name='#{link}' class='anchor' href='##{link}'></a>
    #{text}
  </h#{level}>
  "


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
    .clean false
    # Place before the ignore plugin that removes non-markdown
    # from the stream
    .use metadata
      tagNames: 'categories.yaml'
    # Filename creates meta information about the originalFilename.
    # originalFilename is needed for linking to github for this file.
    .use filename()
    # Remove files from the stream
    .use ignore [
      '**/*'
      '!**/*.md'
      ]
    .use markdown
      renderer: markedRenderer
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
      metadata:
        improvable: true
        template: 'faq.toffee'
    .use defaultMeta
      collection: 'guide'
      metadata:
        improvable: true
        template: 'page.toffee'
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
    .use newPage
      output: '404'
      metadata: template: '404.toffee'
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
    .use aboutSchema() # Add itemprop='about' to the first para
    .use descMeta() # Add Description Metatag to each Document
    # Adding the scripts array to all the pages, means that you can
    # Append the script array with some code, and not worry about the
    # execution order.
    .use defaultMeta
      clone: true
      metadata:
        scripts: []
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
