class PostsController < ApplicationController
  before_action :load_posts

  def index
  end

  def create
    @post = Post.new(post_params.merge({ user: current_user }))
    unless @post.save
      flash[:alert] = @post.errors.full_messages.join("\n")
    end
    render :index
  end

  private

  def post_params
    params.require(:post).permit([:message, :tag_ids])
  end

  def load_posts
    @posts = Post.order(created_at: :desc)
  end
end
