module Reusable

  def remove_white_spaces
    self.first_name = self.first_name.strip.downcase unless self.first_name.nil?
    self.last_name = self.last_name.strip.downcase unless self.last_name.nil?
    self.email = self.email.strip.downcase unless self.email.nil?
  end

  def fullname
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def self.init_or_update klass, attributes 
    object = klass.where(first_name: attributes[:first_name],
                            last_name: attributes[:last_name])
                     .first_or_initialize

    object.assign_attributes({ email: attributes[:email],
                                phone1: attributes[:phone1],
                                phone2: attributes[:phone2],
                                institution: attributes[:institution],
                                location: Location.new(attributes[:location_attributes])})
    return object 
  end

  def serial_number prefix
    "#{prefix}%.6d" % self.id
  end

end
