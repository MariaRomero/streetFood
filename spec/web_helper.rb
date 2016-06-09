def sign_in_with (user)
  visit '/'
  click_link('Login')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def sign_up(params = {
  email: "test@example.com",
  password: "testtest",
  password_confirmation: "testtest"})
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: params[:email])
  fill_in('Password', with: params[:password])
  fill_in('Password confirmation', with: params[:password_confirmation])
  click_button('Sign up')
end
