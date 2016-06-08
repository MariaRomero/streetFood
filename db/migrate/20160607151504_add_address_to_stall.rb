class AddAddressToStall < ActiveRecord::Migration
  def change
    add_column :stalls, :address, :string
  end
end
