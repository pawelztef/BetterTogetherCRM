class Donator < ActiveRecord::Base
  include Reusable
  has_many :donations

  def self.create_or_update first_name, last_name 
    Donator.find_or_create_by(first_name: first_name, last_name: last_name) 
  end
end
