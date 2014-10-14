class ShoutsController < ApplicationController
  before_action :require_login
  
  def index
    @shout = Shout.new
    @shouts = Shout.all
    @users = User.all
    @following_relationship = FollowingRelationship.new

    @users_i_follow = current_user.followed_users.
      where.not(id: current_user.id)
    @users_i_do_not_follow = User.where.not(id: current_user.followed_user_ids).
      where.not(id: current_user.id)
  end

  def create
    #Shout.create(user_id: current_user.id, body: params[:shout][:body])
    current_user.shouts.create(shout_params)

   redirect_to shouts_path
  end

  private
  
  def shout_params
    params.require(:shout).permit(:body)
  end
end
