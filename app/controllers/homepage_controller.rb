class HomepageController < ApplicationController
  def index
    if current_user 
      redirect_to user_t_plan_show_month_path(current_user)
    end
  end
end
