require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:subreddit) }
  it { should validate_presence_of(:title) }
  it { should belong_to(:subreddit) }
  it { should have_many(:comments) }
  it { should have_many(:upvotes) }
  it { should have_many(:downvotes) }
end
