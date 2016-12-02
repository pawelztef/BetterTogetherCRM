class VolunteersGroup < ActiveRecord::Base
  has_many :memberships
  has_many :volunteers, through: :memberships

  validates :name, presence: true,
                   uniqueness: true

end
