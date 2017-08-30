class ChangeCommonDefaultForTraining < ActiveRecord::Migration[5.0]
  def change
    change_column_default :trainings, :length, 0
    change_column_default :trainings, :difficulty, 0
  end
end
