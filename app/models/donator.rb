class Donator < ActiveRecord::Base
  include Reusable
  has_many :donations
  has_one :location, as: :localizable, dependent: :destroy
  before_validation :remove_white_spaces, only: [:first_name, :last_name, :email]

  # EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, presence: true, uniqueness: {scope: :last_name}
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  validates :email, presence: true,
                    uniqueness: true,
                    # format: {with: EMAIL_REGEX},
                    confirmation: true
  validates :phone1, presence: true

  accepts_nested_attributes_for :location

  def self.initialize_or_update donation_attributes 
    donator = Donator.where(first_name: donation_attributes[:donator_attributes][:first_name],
                            last_name: donation_attributes[:donator_attributes][:last_name])
                     .first_or_initialize

    donator.assign_attributes({ email: donation_attributes[:donator_attributes][:email],
                                phone1: donation_attributes[:donator_attributes][:phone1],
                                phone2: donation_attributes[:donator_attributes][:phone2],
                                institution: donation_attributes[:donator_attributes][:institution],
                                location: Location.new(donation_attributes[:donator_attributes][:location_attributes])})
    return donator
  end
  
end
