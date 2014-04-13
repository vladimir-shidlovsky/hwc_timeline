class PostImagesController < ApplicationController
  def create
    uploader = PostImageUploader.new
    uploader.store!(params[:file])
    uploader.cache_stored_file!
    @result = {
      message: I18n.t('flash.actions.upload.notice', resource_name: PostImage.model_name.human),
      cache_name: uploader.cache_name,
      url: uploader.url,
      preview_url: uploader.url(:thumbnail)
    }
    render json: @result.to_json
  end
end
