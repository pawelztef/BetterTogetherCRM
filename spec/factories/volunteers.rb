FactoryGirl.define do
  factory :volunteer do
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:email) { |n| "email@email#{n}.com" }
    phone1 "8989898"
    phone2 "MyString"
  end
end
