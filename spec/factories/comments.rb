FactoryGirl.define do
  factory :comment do
    body "Hello world!"
    user factory: :user
    post factory: :post
  end

end
