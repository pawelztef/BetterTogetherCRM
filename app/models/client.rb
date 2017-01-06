class Client < ActiveRecord::Base
  include Reusable
  before_validation :remove_white_spaces, only: [:first_name, :last_name, :email]
  has_many :dogs, dependent: :destroy
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
    client = Client.where(first_name: attributes[:first_name],
                            last_name: attributes[:last_name])
                     .first_or_initialize

    client.assign_attributes({ email: attributes[:email],
                                phone1: attributes[:phone1],
                                phone2: attributes[:phone2],
                                institution: attributes[:institution],
                                location: Location.new(attributes[:location_attributes])})
    return client
  end


end
