class TrainingController < ApplicationController
before_action :authenticate_user!
# before_action :set_training

def index
  @trainings = current_user.trainings.order(:t_date).page params[:page]
end

def show
  @training = Training.find(params[:id])
end


def new
  if !current_user.admin? then
    redirect_to root_path, alert: "Only for accessible for Admin!"
  end
end

def create
end


def edit 
  if !current_user.admin? then
    redirect_to root_path, alert: "Only for accessible for Admin!"
  end
end

def update
end

def destroy
end

private

  def training_params
    params.require(:training).permit(:t_date, :title, :body, :length, :difficulty)
  end

  # def set_training
  #   @training = Training.find(params[:id])
  # end


end
