#
# # Series
#
# 




module.exports = (opts={}) ->
  opts.prependSeriesTitle ?= true

  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()
    metadata.series ?= {}
    #if metalsmith.metadata().collections?
    #  return console.warn 'The series plugin must be
    #    placed before the collections plugin.'

    # First, go through and add all files with a `series` metaattr to the list
    # of pages for that series.
    for filename, file of files
      if not file.series? then continue
      
      if not file['series-index']?
        console.warn "File #{filename} of series #{file.series}
          is missing the `series-index` metadata. Defaulting to 1"
        file['series-index'] = 1

      # Get the series list, and create it if needed
      metadata.series[file.series] ?= []
      series = metadata.series[file.series]
      index  = file['series-index']

      # If the index exists, then the user defined two guides with the
      # same index. Rather than replace them, we splice the overlap guide
      # into the index. If it doesn't exist, we just assign the index
      # manually.
      #
      # This is done to ensure page order for the series, rather than pushing 
      # then all and then sorting them after.
      if series[index]? then series.splice index, 0, file
      else series[index] = file

    # Now go through and replace the `series` meta attr for each series page
    # with an object for the previous, next, and etc information.
    for seriesName, series of metadata.series
      prev  = null
      title = series[0]?.title
      for page, index in series 
        if opts.prependSeriesTitle is true and index isnt 0 
          page.title = "#{title}: #{page.title}"

        page.series =
          name:        seriesName
          pages:       series
          pageNumber:  index
          prev:        prev
          next:        null
        if prev? then prev.series.next = page
        prev = page

    done()
