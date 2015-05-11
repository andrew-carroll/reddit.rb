FactoryGirl.define do
  factory :subreddit do
    sequence(:name) do |n|
      "subreddit#{n}"
    end
    user factory: :user
  end

end
