FactoryGirl.define do
  factory :user do
    sequence(:username) do |n|
      "snoo#{n}"
    end
    password "hunter2"
    password_confirmation "hunter2"
    sequence(:email) do |n|
      "snoo#{n}@reddit.com"
    end
  end
end
