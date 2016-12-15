FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:email) { |n| "email@email#{n}.com" }
    password "secret"
    ownership 0
  end
end
