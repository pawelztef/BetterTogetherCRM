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
  def self.to_csv
    col_names = %w{id first_name last_name email phone1 phone2 institution line1 line2 city county code dogs}
    client_col = col_names[0, 7]
    location_col = col_names[7, 5]
    CSV.generate() do |csv|
      csv << col_names
      all.each do |client|
        if client.location.present?
          row = client.attributes.values_at(*client_col) + client.location.attributes.values_at(*location_col)
          row[-1] = client.dogs.map { |n| n.name }.join(" ")
          csv << row
        else
          csv << client.attributes.values_at(*col_names)
        end
      end
    end
  end

  # def self.to_csv
  #   col_names = %w{id first_name last_name email phone1 phone2 address }
  #   CsvExport.generate(all, col_names)
  # end


end
