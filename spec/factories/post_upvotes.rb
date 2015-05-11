FactoryGirl.define do
  factory :post_upvote do
    post factory: :post
    user factory: :user
  end
end
