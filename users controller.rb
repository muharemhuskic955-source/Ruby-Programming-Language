class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).where.not(id: current_user.friends.pluck(:id))
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end
end