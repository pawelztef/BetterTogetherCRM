class Dog < ActiveRecord::Base
  belongs_to :client
  
  validates :name, :gender, :age, :breed, presence: true

end
