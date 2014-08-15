#
# # Videos
#
# Some general video code.
#



setupVideos = ->
  jQuery ".youtube-mini"
    .fancybox
      beforeShow: ->
        slug = jQuery @element
          .attr 'slug'
        @title = '<a href="' + slug + '">' + @title + '</a>'
      maxWidth:     800
      maxHeight:    600
      fitToView:    false
      width:        '70%'
      height:       '70%'
      autoSize:     false
      closeClick:   false
      openEffect:   'elastic'
      closeEffect:  'none'
      helpers: title: type: 'inside'




# When jquery is ready, run our setup code.
jQuery(document).ready -> setupVideos()
