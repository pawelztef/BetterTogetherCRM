class Dog < ActiveRecord::Base
  belongs_to :client
  
  vlaidates :name, :gender, :age, :breed, presence: true

end
