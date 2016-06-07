class CreateStalls < ActiveRecord::Migration
  def change
    create_table :stalls do |t|
      t.string :name
      t.string :current_location
      t.integer :rating

      t.timestamps null: false
    end
  end
end
