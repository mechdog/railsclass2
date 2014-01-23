$(document).on 'ready page:load', ->
  $('.delete-sharing').on 'ajax:success', (response) ->
    console.log('delete')
    $(this).parents('tr').fadeOut ->
      $(this).remove()

