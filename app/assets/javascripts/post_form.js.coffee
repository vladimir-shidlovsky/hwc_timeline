class @PostForm

  constructor: () ->
    $('#new-post-form').modal()
    @initFileUpload()

  initFileUpload: () ->
    @uploadField = $('input[type=file]')
    @previewArea = $('[data-behaviour=image-preview]')
    @previewArea.attr('src', '')
    @uploadCacheField = $('#image_cache')
    @uploadField.fileupload
      url: @uploadField.data('url')
      dataType: 'json'
      # dropZone: @previewArea
      limitMultiFileUploads: 1
      type: 'POST'
      formData: {}    # force empty form data to prevent HTTP method overriding
      done: (e, data) =>
        @previewArea.attr('src', data.result.preview_url)
        @uploadCacheField.val(data.result.cache_name)
        alert(data.result.message)
      fail: (e, data) =>
        try
          alert(JSON.parse(data.jqXHR.responseText).message)
        catch exc
          alert('Unknown error.')
