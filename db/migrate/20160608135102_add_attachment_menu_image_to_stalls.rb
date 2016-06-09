class AddAttachmentMenuImageToStalls < ActiveRecord::Migration
  def self.up
    change_table :stalls do |t|
      t.attachment :menu_image
    end
  end

  def self.down
    remove_attachment :stalls, :menu_image
  end
end
