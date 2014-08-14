#
# # Titleify
#
# This plugin allows you to omit the title metadata, and populates it with the
# first found h1.
#
{extname} = require 'path'
cheerio   = require 'cheerio'




# isHtml(file)
#
# Check if the given filename is an html file or not.
isHtml = (filename) -> /\.html?/.test extname filename



module.exports = (opts={}) ->
  opts.replaceMetaTitle ?= false
  opts.removeFromSource ?= true

  (files, metalsmith, done) ->
    for filename,file of files
      # If it's not an html file, ignore it
      if not isHtml filename then continue

      # Create our jquery like object
      $        = cheerio.load file.contents.toString()
      domTitle = $('h1').first()

      # If there is no h1 found, move onto the next file.
      if not domTitle.text()? then continue

      # Set/Replace the file title
      if not file.title? or opts.replaceMetaTitle
        file.title = domTitle
          .text()
          .replace(/^\s+/, '') # Trim opening whitespace
          .replace(/\s+$/, '') # Trim closing whitespace

      # Remove the source h1, if needed
      if opts.removeFromSource
        domTitle.remove()
        file.contents = new Buffer $.html()

    # And of course, after the loop is done.. go home.
    done()
