require 'rails_helper'
require 'web_helper'

feature 'editing posts' do  
  background do
    user = create :user
    user_two = create(:user, email: 'hi@hi.com',
                             user_name: 'BennyBoy',
                             id: user.id + 1)
    stall = create(:stall, user_id: user.id)
    stall_two = create(:stall, user_id: user.id + 1)

    visit '/'
  end

  scenario 'can edit a stall as the owner' do
    #find(:xpath, "//a[contains(@href,'stalls/1')]").click
    visit '/stalls/1'
    expect(page).to have_content('Edit')

    click_link 'Edit'
    fill_in 'Description', with: "Oh god, you weren't meant to see this Stall!"
    click_button 'Update Post'

    expect(page).to have_content('Post updated')
    expect(page).to have_content("Oh god, you weren't meant to see this Stall!")
  end

end  