require 'rails_helper'

feature 'stalls' do
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
