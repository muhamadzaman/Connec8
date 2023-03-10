class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def search
    @users = User.where("name LIKE ? OR username LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
  end
end
