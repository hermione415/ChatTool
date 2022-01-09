class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
