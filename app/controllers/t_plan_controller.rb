class TPlanController < ApplicationController
  def show
    @trainings = Training.all
  end
end
