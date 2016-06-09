FactoryGirl.define do  
  factory :stall do
  	name "Maria's Kitchen"
  	description "Super exciting place to have street food"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/stall.jpg', 'image/jpg')
  	menu_image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/menu.jpg', 'image/jpg')
  end
end  