class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # /users/1
  def show
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name, :image, :username, :tagline)
  end

end