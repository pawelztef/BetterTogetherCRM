class Dog < ActiveRecord::Base
  belongs_to :client
  
  validates :name, :sex, :age, :breed, presence: true

end
