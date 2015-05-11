class PostDownvote < PostVote
  belongs_to :post, required: true, counter_cache: true
end
