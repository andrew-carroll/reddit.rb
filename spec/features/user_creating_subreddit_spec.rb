require 'rails_helper'
include SessionsHelper

feature 'User creating subreddit' do
  context 'while not logged in' do
    scenario 'is redirected to the login page' do
      visit new_subreddit_path
      expect(page).to have_content('Sign in')
    end
  end

  context 'while logged in' do
    background do
      @user = login() 
    end
    context 'and the subreddit already exists' do
      scenario 'fails and receives an error message' do
        create(:subreddit, name: 'programming', user: @user)
        create_subreddit('programming')
        expect(page).to have_content "already exists"
      end
    end

    context 'and the subreddit does not already exist' do
      scenario 'succeeds and is redirected to the subreddit' do
        create_subreddit('programming')
        expect(page).to have_content('programming')
      end
    end
  end
end

def create_subreddit(name)
  visit new_subreddit_path
  within 'form#subreddit' do
    fill_in 'name', with: name
    click_button 'create'
  end
end
