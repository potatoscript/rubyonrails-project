class UsersController < ApplicationController
  before_action :set_user

  # GET /users
  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
    @user.update(views: @user.views + 1)
  end

  private

  def set_user

  end

end
