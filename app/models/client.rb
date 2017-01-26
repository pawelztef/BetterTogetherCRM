class Client < ActiveRecord::Base
  include Reusable
  before_validation :remove_white_spaces, only: [:first_name, :last_name, :email]
  has_many :dogs, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_one :location, as: :localizable, dependent: :destroy

  # EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, presence: true, uniqueness: {scope: :last_name}
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  validates :email, presence: true,
                    uniqueness: true,
                    # format: {with: EMAIL_REGEX},
                    confirmation: true
  validates :phone1, presence: true

  accepts_nested_attributes_for :dogs
  accepts_nested_attributes_for :location

  def self.initialize_or_update attributes
    Reusable.init_or_update Client, attributes
  end

end
