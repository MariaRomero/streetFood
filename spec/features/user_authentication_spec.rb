require 'rails_helper'


feature "User can Log in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'log in' link and a 'Register' link" do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "should not see 'Log out' link" do
      visit('/')
      expect(page).not_to have_link('Logout')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'Log out' link" do
      visit('/')
      expect(page).to have_link('Logout')
    end

    it "should not see a 'log in' link and a 'Register' link" do
      visit('/')
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Register')
    end
  end
end
