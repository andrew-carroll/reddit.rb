FactoryGirl.define do
  factory :post_downvote do
    post factory: :post
    user factory: :user
  end
end
