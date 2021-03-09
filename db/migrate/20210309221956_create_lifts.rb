class CreateLifts < ActiveRecord::Migration[6.1]
  def change
    create_table :lifts do |t|
      t.string :name
      t.integer :first_reps
      t.integer :first_weight
      t.integer :second_reps
      t.integer :second_weight
      t.integer :third_reps
      t.integer :third_weight
    end
  end
end
