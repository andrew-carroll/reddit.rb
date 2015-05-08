require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to :subreddit }
  it { should validate_presence_of :subreddit }
  it { should validate_presence_of :title }
end
