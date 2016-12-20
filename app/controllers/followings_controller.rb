class FollowingsController < ApplicationController
  before_action :authenticate_user!
  def create
    friend = User.find(params[:friend_id])

    params[:user_id] = current_user.id
    Following.create(following_params) unless ( current_user.follows?(friend) || current_user.same?(friend) )
    redirect_to root_path
  end

  def destroy
    # friend = current_user.followings.find_by(friend_id: params[:id])
    # friend = Following.find_by(friend_id: params[:id])
    following = current_user.followings.find_by(friend_id: params[:id])
    following.destroy
    redirect_to root_path
  end

  def show
    # @friend = current_user.followings.find_by(friend_id: params[:id])
    # @friend = Following.find_by(friend_id: params[:id])
    
    # @followed_friend = User.find(params[:id])
    # @exercises = @followed_friend.exercises.where("date > ?", 7.days.ago).order("date DESC")
    @following = Following.find(params[:id])    
    @followed_friend = User.find(@following.friend_id)
    @exercises = @followed_friend.exercises
  end

  private
    def following_params
      params.permit(:friend_id,:user_id)
    end
end

