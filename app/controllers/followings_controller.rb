class FollowingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @friend = User.find(params[:friend_id])

    params[:user_id] = current_user.id
    Following.create(following_params) unless ( current_user.follows?(@friend) || current_user.same?(@friend) )
    
    respond_to do |f|
      f.html {redirect_to root_path}
      f.js
    end

  end

  def destroy
    params[:user_id] = current_user.id
    @friend = User.find(params[:id])
    following = current_user.followings.find_by(friend: @friend)    

    following.destroy
    
    respond_to do |f|
      f.html {redirect_to root_path}
      f.js
    end

  end

  def show
    @following = Following.find(params[:id])    
    @followed_friend = User.find(@following.friend_id)
    @exercises = @followed_friend.exercises.where("date > ?", 7.days.ago).order("date DESC")
  end

  private
    def following_params
      params.permit(:friend_id,:user_id)
    end
end

