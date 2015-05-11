class RankedPost < Post
  scope :hot, -> do
    select(%q{
      *, round(cast(log(greatest(abs(post_upvotes_count - post_downvotes_count), 1)) * sign(post_upvotes_count - post_downvotes_count) + (date_part('epoch', created_at) - 1134028003) / 45000.0 as numeric), 7) as score
           }).order('score desc')
  end
end
