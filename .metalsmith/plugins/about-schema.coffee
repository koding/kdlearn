#
# # About Schema
#
# To add the schema to the about, we need to edit the html of the
# compile markdown, and inject an atribute into it. This plugin
# handles that.
#
{extname} = require 'path'
cheerio   = require 'cheerio'



# isHtml(file)
#
# Check if the given filename is an html file or not.
isHtml = (filename) -> /\.html?/.test extname filename



module.exports = (opts={}) ->
  (files, metalsmith, done) ->
    for filename, file of files
      continue if not isHtml filename
      # This may be subject to too much filtering, hard to say.
      # Why? Well, metalsmith-collections has an issue with files
      # in multiple collections (at the time of this writing).
      continue if file.collection isnt 'guide'

      # Create our jquery like object
      $     = cheerio.load file.contents.toString()
      about = $('p').first()

      # If there is no <p> found, move onto the next file.
      #continue if not ?

      about.attr('itemprop', 'about')
      file.contents = new Buffer $.html()

    # Exit when the loop is done.
    done()
