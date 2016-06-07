require 'rails_helper'

feature 'stalls' do
  context 'adding a new stall' do
    scenario "trader can add a stall with location"do
      visit '/'
      click_link "Add a stall"
      fill_in "Name", with: "Maria's Kitchen"
      fill_in "Description", with: "Amazing Venezuelan food"
      fill_in "Address", with: "24 London St, London, UK"
      click_button "Create Stall"
      expect(current_path).to eq("/stalls")
      expect(page).to have_content "Maria's Kitchen"
      expect(page).to have_content "24 London St"
    end
  end

  context 'stalls have been added' do
    before do
      Stall.create(name: "Maria's Kitchen")
    end
    scenario 'displaying stalls' do
      visit '/stalls'
      expect(page).to have_content "Maria's Kitchen"
    end
  end

  context 'no stalls have been added' do
    scenario 'should display a prompt to add a stall' do
      visit '/stalls'
      expect(page).to have_content 'No stalls yet'
      expect(page).to have_link 'Add a stall'
    end
  end
end
