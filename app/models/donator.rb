class Donator < ActiveRecord::Base
  has_many :donations
end
