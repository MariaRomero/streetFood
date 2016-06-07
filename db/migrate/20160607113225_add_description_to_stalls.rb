class AddDescriptionToStalls < ActiveRecord::Migration
  def change
    add_column :stalls, :description, :string
  end
end
