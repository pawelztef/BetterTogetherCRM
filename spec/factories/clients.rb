FactoryGirl.define do
  factory :client do
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:email) { |n| "email@email#{n}.com" }
    phone1 "MyString"
    phone2 "MyString"
    institution 0
  end
end
