require 'rails_helper'

feature 'Guest logging into account' do
  background do
    @password = 'hunter2'
    @user = create(:user, password: @password)
  end

  context 'with invalid credentials' do
    scenario 'receives an error message' do
      login_with(username: @user.username, password: 'wrongpassword')
      expect(page).to_not have_content "logout"
      expect(page).to have_content "incorrect"
    end
  end

  context 'with valid credentials' do
    scenario 'succeeds and sees a logout link' do
      login_with(username: @user.username, password: @password)
      expect(page).to_not have_content "incorrect"
      expect(page).to have_content "logout"
    end
  end
end

def login_with(username: '', password: '')
  visit login_path
  within 'form#login' do
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Sign In'
  end
end
