#= require jquery
#= require bootstrap
#= require_tree .

$(document).on 'show.bs.modal', (e) ->
  $('[data-toggle=tooltip]').tooltip()


$ ->
  $('[data-toggle=tooltip]').tooltip()

  $('#gallery-modal').on 'show.bs.modal', (e) ->
    $link = $(e.relatedTarget)
    image = $link.data('image') || ''
    footer = $link.next('footer').html() || ''
    $('#gallery-modal img').attr 'src', image
    $('#gallery-modal .modal-footer').html footer
