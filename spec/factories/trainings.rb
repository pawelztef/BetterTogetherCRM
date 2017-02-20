FactoryGirl.define do
  factory :training do
    dog_dog false
    dog_human false
    no_attachment false
    ignore_calling false
    no_heel false
    toilet_home false
    bite_furniture false
    other "MyText"
    event nil
  end
end
