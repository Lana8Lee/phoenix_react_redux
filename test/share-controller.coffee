$ ->
  isTouch  = 'ontouchstart' of document.documentElement

  $(document).on 'click', '.lookbook-user__share-btn', (e) ->
    if $(@).hasClass 'active'
      flipBlocks('.step-share', '.animated-flip')
    else
      flipBlocks('.animated-flip', '.step-share')
      window.lookbook.copy.showTooltip()

    $(@).toggleClass 'active'
    e.preventDefault()
    return

  $(document).on 'click', '.lookbook-user__share-xs', (e) ->
    if $(@).hasClass 'active'
      $('.step-share').fadeOut(200)
    else
      window.lookbook.copy.showTooltip()
      $('.step-share').fadeIn(200)

    $(@).toggleClass 'active'
    e.preventDefault()
    return

  $(document).on 'click', '.step-share__cancel', (e) ->
    shareBtn = $('.lookbook-user__share-xs')
    shareBtn.trigger('click')
    e.preventDefault()
    return

  $(document).on 'click', '.collection-user__share', (e) ->
    if $(@).hasClass 'active'
      $('.step-share__wrap').fadeOut(200)
    else
      window.lookbook.copy.showTooltip()
      $('.step-share__wrap').fadeIn(200)

    $(@).toggleClass 'active'
    e.preventDefault()
    return

  $(document).on 'click', '.share-popup', (e) ->
    popupCenter $(@).attr('href'), $(@).find('.rrssb-text').html(), 580, 470
    e.preventDefault()
    return
  return


# flipBlocks function
flipBlocks = (outBlock, inBlock) ->
  $(outBlock)
    .addClass 'flipOutY'
    .one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
      $(@)
        .hide()
        .removeClass('flipOutY')
      $(inBlock).show()
  return

# popupCenter function
popupCenter = (url, title, w, h) ->
  # Fixes dual-screen position Most browsers Firefox
  dualScreenLeft = if window.screenLeft != undefined then window.screenLeft else screen.left
  dualScreenTop  = if window.screenTop != undefined then window.screenTop else screen.top
  width          = if window.innerWidth then window.innerWidth else if document.documentElement.clientWidth then document.documentElement.clientWidth else screen.width
  height         = if window.innerHeight then window.innerHeight else if document.documentElement.clientHeight then document.documentElement.clientHeight else screen.height
  left           = width / 2 - (w / 2) + dualScreenLeft
  top            = height / 3 - (h / 3) + dualScreenTop
  newWindow      = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left)

  # Puts focus on the newWindow
  if window.focus
    newWindow.focus()
  return
