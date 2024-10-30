class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    result = Posts::CreatePost.call(user_id: params[:user_id], post_params: post_params)

    if result.success?
      redirect_to user_post_path(params[:user_id], result.post), notice: 'Post created successfully.'
    else
      # redirect_to new_user_post_path(user_id: params[:user_id]), alert: result.error
      @post = result.post
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
