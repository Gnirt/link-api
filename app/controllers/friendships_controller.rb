class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_profile_url(current_user.username)
    else
      flash[:error] = "Unable to add friend."
      redirect_to user_profile_url(current_user.username)
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user_profile_url(current_user.username)
  end
end
