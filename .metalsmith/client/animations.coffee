#
# # General Animations
#
# General animation logic.
#




# ## Animate
#
# Add classes to the supplied element, and remove them after the
# animation is done.
animate = (jqo, classes, opts={}) ->
  # The end classes are used by jquery to detect when the animation
  # has ended.
  animEndedClasses = 'webkitAnimationEnd mozAnimationEnd
    MSAnimationEnd oanimationend animationend'

  # First up, add the animation classes.
  jqo.addClass classes

  # If the animation needs to set the display property to a visible
  # (not-none) value, we set it right away so that the animations
  # are visible. Note that the caller should be assigning a
  # css class above that sets the position/alpha/etc of the element
  # properly before setting to display.
  if opts.display? and opts.display != 'none'
    jqo.css 'display', opts.display

  # Add a callback for when the animations end, once.
  jqo.one animEndedClasses, ->
    jqo.css 'display', opts.display if opts.display?
    jqo.removeClass classes


# ## Share Animations
#
# Set the share button to animate the sharebuttons in or out.
setupShareAnimations = ->
  shareBtns = jQuery '#share-buttons'

  # The visiblity/display usage here is due to two things.
  # 1. We want the element hidden on page load.
  # 2. The share javascript has issues if the element is set to
  #  display-none in the source html. So, we're setting it to *hidden*
  #  with the page style, and then when this JS loads we set it to
  #  display-none. This way the share-js works properly, and the
  #  user still doesn't see a flash of the share buttons.
  shareBtns.css 'visibility', 'inherit'
  shareBtns.css 'display', 'none'

  jQuery('#share').click (e) ->
    e.preventDefault()
    switch shareBtns.css 'display'
      when 'block'
        animate shareBtns, 'animated fadeOutUp',
          display: 'none'
      else
        animate shareBtns, 'animated fadeInDown',
          display: 'block'

# ## Search Animations
#
# Setup the animations for when the top search
# icon (upper right) is clicked.
setupSearchAnimations = ->
	jQuery('.topSearchButton').on 'click', ->
    jQuery('.topSearchBox').slideToggle()
    jQuery('.topSearchBox #topSearch').focus()

# ## Mobile menu Animations
#
# Setup the animations for when the mobile menu
# is clicked.
setupMenuAnimations = ->
    jQuery('#mobile-menu').on 'click', ->
        jQuery('.toplinks').slideToggle()
        
setupSubmenuAnimations = ->
    jQuery('nav #menu > .toplinks > li').hover (->
      jQuery(this).find(".icon").removeClass "fa-angle-down"
      jQuery(this).find(".icon").addClass "fa-angle-up"
      return
    ), ->
      jQuery(this).find(".icon").removeClass "fa-angle-up"
      jQuery(this).find(".icon").addClass "fa-angle-down"
      return
    
    jQuery(".submenu .column:first-child > span.submenu-item").each (i) ->
        jQuery(this).hover (->
            jQuery(".submenu .column:last-child > span.submenu-desc").each (j) ->
                if i == j
                    jQuery(this).show()
                return
            return
        ), ->
            jQuery(".submenu .column:last-child > span.submenu-desc").each (j) ->
                if i == j
                    jQuery(this).hide()
                return
            return

setupBackTopAnimations = ->
    offset = 250
    duration = 300
    jQuery(window).scroll ->
      if jQuery(this).scrollTop() > offset
        jQuery('.back-to-top').fadeIn duration
      else
        jQuery('.back-to-top').fadeOut duration
      return
    jQuery('.back-to-top').click (event) ->
      event.preventDefault()
      jQuery('html, body').animate { scrollTop: 0 }, duration
      false

# When jquery is ready, setup our animations.
jQuery(document).ready ->
  setupSearchAnimations()
  setupShareAnimations()
  setupMenuAnimations()
  setupSubmenuAnimations()
  setupBackTopAnimations()