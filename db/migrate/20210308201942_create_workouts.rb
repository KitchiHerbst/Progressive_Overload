class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :lifter_id
      t.integer :gym_id
    end
  end
end
