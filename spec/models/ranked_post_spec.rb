require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

describe RankedPost do
  let(:ranked_post) { create(:ranked_post) }
  it 'is a subclass of Post' do
    expect(ranked_post).to be_a_kind_of(Post)
  end

  describe '.hot' do
    let(:modernity) { Time.new(2015, 5, 11, 17, 37, 45) }
    let(:history) { Time.new(2012, 5, 11, 17, 37, 45) }
    it "returns a collection of Posts ranked by Reddit's hot algorithm" do
      travel_to modernity
      upvote(ranked_post, 25)
      collection = RankedPost.hot
      expect(collection.first.score).to eq(6609.2430178)
    end

    it "prioritizes new posts over popular posts" do
      travel_to history
      old_post = create(:ranked_post)
      upvote(old_post, 5)

      travel_to modernity
      new_post = ranked_post
      collection = RankedPost.hot
      expect(collection).to eq([new_post, old_post])
    end
  end
end

def upvote(post, count)
  count.times { create(:post_upvote, post: post) }
end
