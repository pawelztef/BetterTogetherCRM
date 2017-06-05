class WelcomeMail < ActiveRecord::Base

  validates :body, presence: true
  validates :subject, presence: true

  def self.pull
    first_or_create
  end
end
