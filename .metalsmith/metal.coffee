#
# # Metal
#
# Our metalsmith build code.
#
path         = require 'path'
highlightjs  = require 'highlight.js'
marked       = require 'marked'
metalsmith   = require 'metalsmith'
collections  = require 'metalsmith-collections'
drafts       = require 'metalsmith-drafts'
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
popularApi   = require './plugins/popularapi'
moment       = require './plugins/moment'
feed         = require './plugins/feed'
filename     = require './plugins/filename'
newPage      = require './plugins/new-page'
recentApi    = require './plugins/recentapi'
redirects    = require './plugins/redirects'
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

# In our version of blockquote, we're looking for `type:foo` strings
# and styling the blockquote based on that string.
#
# It's also worth noting that we're *only* looking at that string if
# it starts a paragraph on a line of it's own. This is mainly for
# implementation simplicity, but also helps provide a sane way to
# split up the markdown. If you want two blockquotes, add a newline to
# ensure a new paragraph.
markedRenderer.blockquote = (quote) ->
  quoteTypes =
    "good": "good fa fa-check-circle"
    "warning": "warning fa fa-info-circle"
    "error": "error fa fa-exclamation-circle"

  # Blocks is the final list of blockquotes that we're going to return
  blocks = []
  # Split the quote based on `<p>type:`, since we know that is what
  # starts any quote types. We can then iterate over it, with the
  # knowledge that each item in the array is a potentially blockquote
  for block, i in quote.split "<p>type:"
    # If block is empty, skip it. This means that <p>type: was at
    # the beginning of the quote, and we can ignore it
    continue if block == ""
    typeMatch = false
    classes = ""
    for quoteType, _classes of quoteTypes
      # If the blockquote starts with our type, we found it!
      if block.indexOf("#{quoteType}\n") == 0
        typeMatch = true
        classes = _classes
        # Remove the quoteType\n from the block. Eg,
        # `good\nfoo\nbar` becomes `foo\nbar`
        block = block[quoteType.length+1...]
        # Add back the <p> that we stole, but ignore the type, since
        # we don't want that in the final quote for matches
        block = "<p>" + block
    # If there was no match for any quoteType, then add back the
    # <p>type: that we stole
    # Note that the zero index (0) wasn't actually split on the type,
    # so make sure not to add type back.
    if not typeMatch and i != 0 then block = "<p>type:" + block
    # Now add our block to the final list
    blocks.push "
    <blockquote class=\"#{classes}\">
      #{block}
    </blockquote>
    "
  # And finally, return our blocks
  blocks.join '\n'


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
    .use drafts()
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
        pattern: 'faq/**/*.html'
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
    # Create our redirects
    .use redirects()
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
    # Exposes /api/recent and all variants
    .use recentApi()
    # Exposes /api/popular and all variants
    .use popularApi()
    .use templates 'toffee'
    .build callback



# If this file is executed directly, run the build script.
if require.main is module then build()
