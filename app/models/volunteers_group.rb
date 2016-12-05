class VolunteersGroup < ActiveRecord::Base
  has_many :memberships, dependent: :restrict_with_exception
  has_many :volunteers, through: :memberships

  validates :name, presence: true,
                   uniqueness: true
end
