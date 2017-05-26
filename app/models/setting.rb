class Setting < ActiveRecord::Base

  def self.pull
    first_or_create
  end

end
