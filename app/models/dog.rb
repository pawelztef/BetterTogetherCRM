class Dog < ActiveRecord::Base
  include Reusable
  belongs_to :client, validate: false
  has_and_belongs_to_many :custom_events 
  validates :name, :sex, :age, :breed, :chip_id, presence: true
  validates :sex, length: { is: 1}
  validates :name, uniqueness: {scope: :chip_id}
  accepts_nested_attributes_for :client
  def self.to_csv
    col_names = %w{id name chip_id age breed sex first_name last_name 
                  email phone1 phone2 line1 line2 city county code}
    dog_col = col_names[0, 6]
    owner_col = col_names[6, 5]
    location_col = col_names[11, 7]
    CSV.generate() do |csv|
      csv << col_names
      all.each do |dog|
        if dog.client.present?
          row = dog.attributes.values_at(*dog_col) + dog.client.attributes.values_at(*owner_col)
          row += dog.client.location.attributes.values_at(*location_col) if dog.client.location.present?
          csv << row
        else
          csv << volunteer.attributes.values_at(*dog_col)
        end
      end
    end
  end
  
  def id_no 
    self.serial_number("DG")
  end

end
