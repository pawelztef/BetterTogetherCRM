module Reusable
  def remove_white_spaces
    self.first_name = self.first_name.strip.downcase unless self.first_name.nil?
    self.last_name = self.last_name.strip.downcase unless self.last_name.nil?
    self.email = self.email.strip.downcase unless self.email.nil?
  end
  def fullname
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end
