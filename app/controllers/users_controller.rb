class UsersController < ApplicationController
  before_action :authenticate_admin, only: [:index, :new, :destroy]
  before_action :authenticate_user!, except: [:index, :new, :destroy]
  
  def index
    @users = User.all
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to @user, alert: "Update successfull!"
    else
      render "edit"
      flash.now "Could not update!"
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy!
      redirect_to users_path, alert: "User deleted!"
    else
      render "index"
      flash.now "Could not delete User!"
    end
  end

private

  def authenticate_admin
      redirect_to root_path, alert: 'Not authorized.' unless current_user && current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
