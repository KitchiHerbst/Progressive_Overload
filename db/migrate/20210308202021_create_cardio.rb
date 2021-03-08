class CreateCardio < ActiveRecord::Migration[6.1]
  def change
    create_table :cardio do |t|
      t.string :name
      t.integer :workout_id
      t.integer :lifter_id
      t.float :distance
      t.float :time
    end
  end
end

