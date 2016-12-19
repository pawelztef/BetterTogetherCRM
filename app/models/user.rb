class User < ActiveRecord::Base
  include Reusable

  before_validation :remove_white_spaces, only: [:first_name, :last_name, :email]

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, presence: true, uniqueness: {scope: :last_name}
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  validates :email, presence: true,
                    uniqueness: true,
                    # format: {with: EMAIL_REGEX},
                    confirmation: true

  has_secure_password
  has_one :location, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :location


  def fullname
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def owner?
    if self.ownership
      return true 
    else
      return false
    end
  end

end
