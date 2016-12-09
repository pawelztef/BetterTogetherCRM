class Volunteer < ActiveRecord::Base
  include Reusable

  before_validation :remove_white_spaces, only: [:first_name, :last_name, :email]

  has_many :memberships, dependent: :destroy
  has_many :volunteers_groups, through: :memberships
  has_one :location, as: :localizable, dependent: :destroy
  
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :memberships

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, presence: true, uniqueness: {scope: :last_name}
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  validates :email, presence: true,
                    uniqueness: true,
                    # format: {with: EMAIL_REGEX},
                    confirmation: true
  validates :phone1, presence: true


  def fullname
    "#{self.first_name} #{self.last_name}"
  end
  
 
end
