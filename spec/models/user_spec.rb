require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of :username }
  it { should validate_presence_of :password }
  
  let(:user) { create(:user) }
  describe 'voting' do
    let(:post) { create(:post) }
    describe '#upvote' do
      context 'when the user has already voted on that post' do
        before(:example) { user.upvote(post) }
        it 'raises User::AlreadyVotedError' do
          expect{user.upvote(post)}.to raise_error(User::AlreadyVotedError)
        end
      end

      context 'when the user has not already voted on that post' do
        it 'creates an upvote for the post' do
          expect{user.upvote(post)}.to change{post.upvotes.count}.by(1)
        end
      end
    end

    describe '#downvote' do
      context 'when the user has already voted on that post' do
        before(:example) { user.downvote(post) }
        it 'raises User::AlreadyVotedError' do
          expect{user.downvote(post)}.to raise_error(User::AlreadyVotedError)
        end
      end

      context 'when the user has not already voted on that post' do
        it 'creates an downvote for the post' do
          expect{user.downvote(post)}.to change{post.downvotes.count}.by(1)
        end
      end
    end
  end
end
