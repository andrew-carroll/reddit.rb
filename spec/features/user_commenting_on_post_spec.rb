require 'rails_helper'
include SessionsHelper

feature 'User commenting on post' do
  background do
    @post = create(:post)
  end
  context 'while not logged in' do
    scenario 'does not see comment form' do
      visit comments_path(@post.subreddit, @post)
      expect(page).to_not have_css('form#post_reply')
    end
  end

  context 'while logged in' do
    background do
      login()
    end
    scenario 'succeeds and sees the comment' do
      comment_on_post(body: 'Hello world!')
      expect(page).to have_content 'Hello world!'
    end
  end
end

def comment_on_post(body: 'Hello world!')
  visit comments_path(@post.subreddit, @post)
  within 'form#post_reply' do
    fill_in 'comment_body', with: body
    click_button 'Save'
  end
end
