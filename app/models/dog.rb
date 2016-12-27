class Dog < ActiveRecord::Base
  belongs_to :client, validate: false
  
  validates :name, :sex, :age, :breed, presence: true
  validates :sex, length: { is: 1}

  accepts_nested_attributes_for :client

end
