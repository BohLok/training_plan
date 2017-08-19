class TrainingController < ApplicationController
before_action :authenticate_user!
# before_action :set_training

def index
  @trainings = current_user.trainings
end

def show
  @training = Training.find(params[:id])
end


def new
end

def create
end


def edit 
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
