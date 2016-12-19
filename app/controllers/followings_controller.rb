class FollowingsController < ApplicationController
  before_action :authenticate_user!
  def create
    friend = User.find(params[:friend_id])

    params[:user_id] = current_user.id
    Following.create(following_params) unless ( current_user.follows?(friend) || current_user.same?(friend) )
    redirect_to root_path
  end

  def destroy
    friend = Following.find_by(friend_id: params[:id])
    current_user.followings.destroy(friend)
    redirect_to root_path
  end

  private
    def following_params
      params.permit(:friend_id,:user_id)
    end
end

