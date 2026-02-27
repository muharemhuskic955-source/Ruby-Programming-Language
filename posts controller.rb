class PostsController < ApplicationController
  def index
    @posts = current_user.friends_and_own_posts.includes(:user, :comments)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post created successfully!'
    else
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end