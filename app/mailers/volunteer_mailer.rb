class VolunteerMailer < ApplicationMailer
  default from: "BetterToggether"

  def welcome_mail(volunteer)
    @volunteer = volunteer
    @email_template = WelcomeMail.pull 
    mail to: volunteer.email
  end
end
