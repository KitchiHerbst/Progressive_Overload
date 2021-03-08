class CreateLifters < ActiveRecord::Migration[6.1]
  def change 
    create_table :lifters do |t|
      t.string :name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :gender
    end
  end
end
