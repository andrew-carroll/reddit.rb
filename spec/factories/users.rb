FactoryGirl.define do
  factory :user do
    username "snoo"
    password "hunter2"
    password_confirmation "hunter2"
    sequence(:email) do |n|
      "snoo#{n}@reddit.com"
    end
  end
end
