#
# # Images
#
# Some general images code.
#



setupImages = ->
  jQuery ".docs-content img"
    .each ->
      jQuery this
        .fancybox 
          href: 
            jQuery this
              .attr "src"
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
jQuery(document).ready -> setupImages()
