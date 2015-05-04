FactoryGirl.define do
  factory :subreddit do
    name "MyString"
    user factory: :user
  end

end
