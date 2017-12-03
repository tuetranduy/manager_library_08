class UserFollowRelationshipsController < ApplicationController
  before_action :logged_in?

  def create
    @user = User.find(params[:followed_id])
    if @user
      current_user.user_follow(@user)
      respond_action
    else
      relation_error
    end
  end

  def destroy
    @user = UserFollowRelationship.find(params[:id]).followed
    if @user
      current_user.user_unfollow(@user)
      respond_action
    else
      relation_error
    end
  end

  private

  def respond_action
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def relation_error
    flash[:danger] = t "form.follow_error"
    redirect_to root_url
  end
end
