require 'rails_helper'

RSpec.describe Subreddit, type: :model do
  it { should validate_presence_of(:name) }

  describe 'uniqueness' do
    subject { create(:subreddit) }
    it do
      should validate_uniqueness_of(:name).
        with_message /already exists/
    end
  end

  describe '#to_param' do
    it 'returns the #name of the subreddit' do
      subreddit = create(:subreddit)
      expect(subreddit.to_param).to eq(subreddit.name)
    end
  end
end
