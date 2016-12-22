class Dog < ActiveRecord::Base
  belongs_to :client
  # has_one :location, through: :client
  
  validates :name, :sex, :age, :breed, presence: true
  validates :sex, length: { is: 1}

  accepts_nested_attributes_for :client
  # accepts_nested_attributes_for :location

end
