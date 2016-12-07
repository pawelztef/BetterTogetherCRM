class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    # format: {with: EMAIL_REGEX},
                    confirmation: true

  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  def owner?
    if self.ownership
      return true 
    else
      return false
    end
  end

end
