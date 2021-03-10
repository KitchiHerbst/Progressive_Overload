class WorkoutTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_types do |t|
      t.integer :workout_id
      t.integer :lift_id
    end
  end
end
