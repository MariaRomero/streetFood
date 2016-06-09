def sign_in_with (user)
  visit '/'
  click_link('Login')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def sign_up(params = {
  user_name: "test",
  email: "test@example.com",
  password: "testtest",
  password_confirmation: "testtest"})
  visit('/')
  click_link('Register')
  fill_in('User name', with: params[:user_name])
  fill_in('Email', with: params[:email])
  fill_in('Password', with: params[:password])
  fill_in('Password confirmation', with: params[:password_confirmation])
  click_button('Sign up')
end

def creating_stall_maria
  click_link "New Stall"
  fill_in "Name", with: "Maria's Kitchen"
  fill_in "Description", with: "Amazing Venezuelan food"
  fill_in "Address", with: "24 London St, London, UK"
  click_button "Create Stall"
end

def creating_stall_tacos
  click_link "New Stall"
  fill_in "Name", with: "Ricos Tacos"
  fill_in "Description", with: "Amazing Tacos"
  fill_in "Address", with: "24 york road, brighton, bn3 1dl"
  click_button "Create Stall"
end
