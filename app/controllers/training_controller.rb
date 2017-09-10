class TrainingController < ApplicationController
before_action :authenticate_user!
before_action :set_trainee

def index
  @trainings = @trainee.trainings.order(:t_date).page params[:page]


end

def show
  @training = @trainee.trainings.find(params[:id])
end


def new
  if !current_user.admin? then
    redirect_to root_path, alert: "Only for accessible for Admin!"
  end
  # @training = @trainee.trainings.build
  @training = Training.new
end

def create
  @training = @trainee.trainings.build(training_params)
  if @training.save!
    redirect_to user_training_path(@trainee, @training), alert: "Training successfully created!"
  else
    render "new", alert: "Training could not be saved!"
  end
end


def edit 
  if !current_user.admin? then
    redirect_to user_training_index_path(@trainee), alert: "Only for accessible for Admin!"
  else
    @training = @trainee.trainings.find(params[:id])
  end
end

def update
  @training = @trainee.trainings.find(params[:id])
  if @training.update_attributes(training_params)
    flash[:success] = "Successfully updated!"
    redirect_to user_training_path(@trainee, @training)
  else
    flash.now[:error] = "Could not update!"

    render "edit"
  end
end

def destroy
  @training = @trainee.trainings.find(params[:id])
  if current_user.admin?
    if @training.destroy
      redirect_to user_training_index_path(@trainee), alert: "Training deleted!"
    else
      redirect_to user_training_index_path(@trainee), alert: "Could not delete Training"
    end
  else
    redirect_to user_training_index_path(@trainee), alert: "Admin-rights required!"
  end
end

private

  def training_params
    params.require(:training).permit(:t_date, :title, :body, :length, :difficulty)
  end

  # def set_training
  #   @training = Training.find(params[:id])
  # end

  def set_trainee
    if current_user.admin?
      @trainee = User.find(params[:user_id])
    else
      @trainee = current_user
    end
  end
end
