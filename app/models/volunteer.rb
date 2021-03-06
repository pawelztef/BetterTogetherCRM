class Volunteer < ActiveRecord::Base
  include Reusable

  before_validation :remove_white_spaces, only: [:first_name, :last_name, :email]



  has_many :memberships, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :volunteers_groups, through: :memberships, dependent: :destroy
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


  def self.to_csv
    col_names = %w{id first_name last_name email phone1 phone2 line1 line2 city county code groups}
    volunteer_col = col_names[0, 6]
    location_col = col_names[6, 7]
    CSV.generate() do |csv|
      csv << col_names
      all.each do |volunteer|
        if volunteer.location.present?
          row = volunteer.attributes.values_at(*volunteer_col) +
            volunteer.location.attributes.values_at(*location_col)
          row[-1] = volunteer.volunteers_groups.map { |n| n.name }.join(" ")
          csv << row
        else
          row = volunteer.attributes.values_at(*volunteer_col)
          row[-1] = volunteer.volunteers_groups.map { |n| n.name }.join(" ")
          csv << row
        end
      end
    end
  end

  def group_name
    self.volunteers_groups.pluck(:name)
  end

end
