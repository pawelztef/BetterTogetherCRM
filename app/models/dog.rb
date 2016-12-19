class Dog < ActiveRecord::Base
  belongs_to :client
  
  validates :name, :sex, :age, :breed, presence: true
  validates :sex, length: { is: 1}

end
