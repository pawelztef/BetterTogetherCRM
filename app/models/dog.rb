class Dog < ActiveRecord::Base
  belongs_to :client, validate: false
  has_and_belongs_to_many :custom_events 
  validates :name, :sex, :age, :breed, presence: true
  validates :sex, length: { is: 1}

  accepts_nested_attributes_for :client

end
