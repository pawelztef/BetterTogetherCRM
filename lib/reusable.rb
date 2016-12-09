module Reusable
  def remove_white_spaces
    self.first_name = self.first_name.strip.capitalize unless self.first_name.nil?
    self.last_name = self.last_name.strip.capitalize unless self.last_name.nil?
    self.email = self.email.strip.capitalize unless self.email.nil?
  end
end
