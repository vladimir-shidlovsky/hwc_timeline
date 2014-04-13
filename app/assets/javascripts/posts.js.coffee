$('.container').on 'click', '#create-new-post', (e) ->
  e.preventDefault()
  new PostForm()
  false
