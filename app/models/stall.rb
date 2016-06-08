class Stall < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_attached_file :menu_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :menu_image, :content_type => /\Aimage\/.*\Z/
end
