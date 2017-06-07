class VolunteerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.volunteer_mailer.welcome_mail.subject
  #
  def welcome_mail(volunteer)
    @volunteer = volunteer
    @email_template = WelcomeMail.pull 
    mail to: volunteer.email
  end
end
