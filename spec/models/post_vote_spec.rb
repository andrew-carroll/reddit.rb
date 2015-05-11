require 'rails_helper'

RSpec.describe PostVote, type: :model do
  [:post_upvote, :post_downvote].each do |vote_type|
    describe vote_type do
      subject { create(vote_type) }
      it { should belong_to(:user) }
      it { should belong_to(:post).counter_cache(true) }
      it { should validate_uniqueness_of(:post_id).scoped_to(:user_id) }
    end
  end
end
