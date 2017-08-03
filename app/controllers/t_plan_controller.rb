class TPlanController < ApplicationController
 before_action :authenticate_user!
  def show
    @trainings = current_user.trainings
  end
end
