class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])
    current_user.friendships.create(friend: friend)
    redirect_back(fallback_location: users_path)
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship&.destroy
    redirect_back(fallback_location: users_path)
  end
end