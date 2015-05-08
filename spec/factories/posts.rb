FactoryGirl.define do
  factory :post do
    title "MyString"
    url "MyString"
    subreddit factory: :subreddit
  end
end
