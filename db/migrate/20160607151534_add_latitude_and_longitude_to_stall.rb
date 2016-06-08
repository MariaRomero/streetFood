class AddLatitudeAndLongitudeToStall < ActiveRecord::Migration
  def change
    add_column :stalls, :latitude, :float
    add_column :stalls, :longitude, :float
  end
end
