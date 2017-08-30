class UsersController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  def show
  end

private

def authenticate_admin
    redirect_to root_path, alert: 'Not authorized.' unless current_user && current_user.admin?
end

end
