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

  context 'viewing stalls' do

  let!(:maria){ Stall.create(name:'Maria\'s Kitchen') }

  scenario 'lets a user view a stall' do
   visit '/stalls'
   click_link 'Maria\'s Kitchen'
   expect(page).to have_content 'Maria\'s Kitchen'
   expect(current_path).to eq "/stalls/#{maria.id}"
  end

end

  context 'no stalls have been added' do
    scenario 'should display a prompt to add a stall' do
      visit '/stalls'
      expect(page).to have_content 'No stalls yet'
      expect(page).to have_link 'Add a stall'
    end
  end

  context 'stalls have been added and edited' do

    before do
      Stall.create(name: "Maria's Kitchen", description: "Venezuelan food", address: "37 foredown drive, brighton, bn412bd")
    end

    scenario 'displaying stalls' do
      visit '/stalls'
      expect(page).to have_content "Maria's Kitchen"
    end

    scenario 'let a trader edit a stall' do
      visit '/stalls'
      click_link 'Edit'
      fill_in 'Name', with: "Maria's Food Stall"
      fill_in 'Description', with: "Arepas"
      fill_in "Address", with: "105 rectory field crescent, london, SE77EN"
      click_button 'Update'
      expect(page).to have_content "Maria's Food Stall"
      expect(page).to have_content "Arepas"
      expect(page).to have_content "105 rectory field crescent, london, SE77EN"
      expect(current_path).to eq "/stalls"
    end

    scenario 'let a trader delete a stall' do
      visit '/stalls'
      click_link 'Delete'
      expect(page).not_to have_content "Maria's Kitchen"
      expect(page).not_to have_content "Venezuelan food"
      expect(page).not_to have_content "37 foredown drive, brighton, bn412bd"
      expect(page).to have_content 'Stall deleted successfully'
    end
  end

  context 'search for stalls' do
    before do
      Stall.create(name: "Maria's Kitchen", description: "Venezuelan food", address: "37 foredown drive, brighton, bn412bd")
      Stall.create(name: "Taco Stand", description: "Tacos", address: "105 rectory field crescent, london, SE77EN")
    end
    scenario 'search by location' do
      visit '/stalls'
      fill_in "Where are you?", with: "London, UK"
      click_button "Submit"
      expect(page).not_to have_content "Maria's Kitchen"
      expect(page).to have_content "Taco Stand"
    end
  end
end
