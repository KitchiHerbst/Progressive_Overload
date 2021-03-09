





class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.integer :lifter_id
      t.integer :gym_id
      t.timestamp :start
      t.timestamp :end
      t.boolean :weights
      t.boolean :cardio
    end
  end
end
