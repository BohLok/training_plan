class AddUserToTraining < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainings, :user, foreign_key: true
  end
end
