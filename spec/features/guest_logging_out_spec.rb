require 'rails_helper'
include SessionsHelper

feature 'Guest logging out' do
  scenario 'is logged out' do
    login
    click_link 'logout'
    expect(page).to_not have_content('logout')
  end
end
