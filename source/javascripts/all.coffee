#= require jquery
#= require bootstrap
#= require_tree .

window.setMinHeight = ->
  offset = $('footer#main').outerHeight()
  console.log offset
  $('body > .container').css('min-height', $('body').height() - offset)

$(window).on 'orientationchange', setMinHeight
$(window).on 'resize', setMinHeight

$ ->
  setMinHeight()

  $('#gallery-modal').on 'show.bs.modal', (e) ->
    $link = $(e.relatedTarget)
    image = $link.data('image') || ''
    title = $link.find('img').attr('alt') || ''
    footer = $link.next('footer').html() || ''
    console.log $link
    $('#gallery-modal img').attr 'src', image
    $('#gallery-modal h4').text title
    $('#gallery-modal .modal-footer').html footer
