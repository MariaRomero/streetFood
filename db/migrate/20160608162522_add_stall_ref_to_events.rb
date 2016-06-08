class AddStallRefToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :stall, index: true, foreign_key: true
  end
end
