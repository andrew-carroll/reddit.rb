require 'rails_helper'

feature 'Guest creating account' do
  background do
    visit login_path
  end

  context 'with valid credentials' do
    scenario 'succeeds and signs in automatically' do
      register_with(username: 'snoo', password: 'hunter2')
      expect(page).to have_content('logout')
    end
  end

  context 'with invalid credentials' do
    scenario 'fails and receives an error message' do
      register_with(username: 'snoo', password: '')
      expect(page).to have_content("can't be blank")
    end
  end
end

def register_with(username: '', password: '')
  within "form#registration" do
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Create Account'
  end
end
