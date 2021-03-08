class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.string :name
      t.integer :workout_id
      t.integer :lifter_id
      t.integer :first_reps
      t.integer :first_weight
      t.integer :second_reps
      t.integer :second_weight
      t.integer :third_reps
      t.integer :third_weight
    end
  end
end
