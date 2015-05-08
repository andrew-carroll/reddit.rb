require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:post)}
  it { should validate_presence_of(:user)}
  it { should validate_presence_of(:body)}
  it { should validate_length_of(:body).
       is_at_least(10).is_at_most(40_000) }
end
