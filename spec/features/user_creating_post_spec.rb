require 'rails_helper'
include SessionsHelper

feature 'User creating post' do
  background do
    user = create(:user, username: 'programmer') 
    create(:subreddit, name: 'programming', user: user)
  end
  context 'while not logged in' do
    scenario 'is redirected to the login page' do
      visit new_subreddit_post_path('programming')
      expect(page).to have_content 'Sign in'
    end
  end

  context 'while logged in' do
    background do
      login()
    end
    scenario 'succeeds and is redirected to the post' do
      create_link_post('My first post', 'www.google.com')
      expect(page).to have_content 'My first post'
    end
  end
end

def create_link_post(title, url)
  visit new_subreddit_post_path('programming')
  within 'form#link_post' do
    fill_in 'post_title', with: title
    fill_in 'post_url', with: url
    click_button 'submit'
  end
end
