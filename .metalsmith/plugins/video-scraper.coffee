#
# # Video Scrape
#
clone = require 'clone'




module.exports = ({collection, key}) ->
  collection ?= 'videos'
  key        ?= 'videoUrl'
  (files, metalsmith, done) ->
    collections = metalsmith.metadata().collections
    if not collections?
      return console.warn 'videoScraper should be run after collections()'

    collections[collection] ?= []
    coll = collections[collection]

    previous = null
    for name, file of files
      if file[key]?
        file          = clone file
        previous.next = file if previous?
        file.previous = previous
        file.next     = null
        previous      = file
        coll.push file
    done()

