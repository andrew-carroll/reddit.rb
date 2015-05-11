FactoryGirl.define do
  factory :post do
    title "MyString"
    url "MyString"
    subreddit factory: :subreddit
    user factory: :user
    
    factory :ranked_post, class: RankedPost do; end
  end
end
