class Volunteer < ActiveRecord::Base

  has_many :memberships
  has_many :volunteers_groups, through: :memberships

  



  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    # format: {with: EMAIL_REGEX},
                    confirmation: true
  validates :phone1, presence: true


  def fullname
    "#{self.first_name} #{self.last_name}"
  end
  
end
