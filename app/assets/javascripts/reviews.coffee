$(document).ready (e) ->
  $('.star').click (e) ->
    e.preventDefault()
    $('#hidden-rating').val $(this).data('value')
    $(this).siblings().removeClass 'selected'
    $(this).addClass 'selected'
    return
  $('.star').on 'mouseenter', (e) ->
    $(this).parent().removeClass 'enabled'
    return
  $('.star').on 'mouseleave', (e) ->
    $(this).parent().addClass 'enabled'
    return
  return