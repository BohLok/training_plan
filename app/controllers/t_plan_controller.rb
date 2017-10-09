class TPlanController < ApplicationController
 before_action :authenticate_user!
 before_action :set_trainee
 before_action :set_start_date
  
  def show_month
    @trainings = @trainee.trainings
  end

  def show_week
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

  def set_start_date
    if !params[:start_date]
      
      params[:start_date] = Date.today
    end
    @start_date = params[:start_date]
  end

end
