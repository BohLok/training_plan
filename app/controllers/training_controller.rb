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
  @training = Training.new
end

def create
  @training = Training.new(training_params)
  if @training.save
    redirect_to user_training_path(current_user, @training), alert: "Training successfully created!"
  else
    render "new", alert: "Training could not be saved!"
  end
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
