# Preview all emails at http://localhost:3000/rails/mailers/volunteer_mailer
class VolunteerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/volunteer_mailer/welcome_mail
  def welcome_mail
    VolunteerMailer.welcome_mail
  end

end
