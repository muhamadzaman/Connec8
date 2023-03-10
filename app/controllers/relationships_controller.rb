class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to search_users_path(query: params[:query])
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to search_users_path(query: params[:query])
  end
end
