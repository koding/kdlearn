#
# # Search
#
# Search related coffee.
#



setupSearch = ->
  pathname = jQuery location # Get the browser location
    .attr 'pathname' # Extract the pathname from that
    .replace /\//g, '' # Remove path ambiguity, /search/ vs /search

  # If we're not on the search page, we don't run.
  if pathname isnt 'search' then return

  # Get the search results element, and use tapir to populate it.
  jQuery '#search-results'
    .tapir
      'host':           'http://ulkk65a182f3.leeolayvar.koding.io:3000/search'
      'token':          '543475ab3493cda4d1000001'
      'query_param':    'q'
      'summary_limit':  400



jQuery(document).ready -> setupSearch()
