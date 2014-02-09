#= require jquery
#= require bootstrap
#= require_tree .

window.setMinHeight = ->
  offset = $('footer#main').outerHeight()
  console.log offset
  $('body > .container').css('min-height', $('body').height() - offset)

$(window).on 'orientationchange', setMinHeight
$(window).on 'resize', setMinHeight

$(document).on 'show.bs.modal', (e) ->
  $('[data-toggle=popover]').popover()


$ ->
  setMinHeight()

  $('[data-toggle=popover]').popover()

  $('#gallery-modal').on 'show.bs.modal', (e) ->
    $link = $(e.relatedTarget)
    image = $link.data('image') || ''
    footer = $link.next('footer').html() || ''
    $('#gallery-modal img').attr 'src', image
    $('#gallery-modal .modal-footer').html footer
