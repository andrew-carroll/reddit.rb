FactoryGirl.define do
  factory :post do
    title "MyString"
    url "MyString"
    subreddit factory: :subreddit
    user factory: :user
  end
end
