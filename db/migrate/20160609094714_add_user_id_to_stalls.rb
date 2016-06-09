class AddUserIdToStalls < ActiveRecord::Migration
  def change
    add_reference :stalls, :user, index: true, foreign_key: true
  end
end
