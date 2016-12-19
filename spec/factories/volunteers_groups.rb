FactoryGirl.define do
  factory :volunteers_group do
    sequence(:name) { |n| "GroupName#{n}" }
    description "Description"
  end
end
