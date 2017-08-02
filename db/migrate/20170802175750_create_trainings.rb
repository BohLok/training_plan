class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.date :t_date
      t.string :title
      t.text :body
      t.integer :length
      t.integer :difficulty

      t.timestamps
    end
  end
end
