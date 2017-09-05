class TPlanController < ApplicationController
 before_action :authenticate_user!
 before_action :set_trainee
  def show
    @trainings = @trainee.trainings
  end

private
  def set_trainee
    if current_user.admin?
      @trainee = User.find(params[:user_id])
    else
      @trainee = current_user
    end
  end

end
