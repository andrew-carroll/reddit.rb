require 'rails_helper'

feature 'Guest logging out' do
  background do
    @password = 'hunter2'
    @user = create(:user, password: @password)
  end

  scenario 'is logged out' do
    login_with(username: @user.username, password: @password)
    click_link 'logout'
    expect(page).to_not have_content('logout')
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
