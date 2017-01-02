class Donator < ActiveRecord::Base
  include Reusable
  has_many :donations
end
