class HomeController < ApplicationController
  def index
    redirect_to posts_path if signed_in?
  end
end
