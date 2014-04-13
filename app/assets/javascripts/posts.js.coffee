$('.container').on 'click', '#create-new-post', (e) ->
  e.preventDefault()
  $('#new-post-form').modal()
  false
