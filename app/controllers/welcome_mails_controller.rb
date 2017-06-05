class WelcomeMailsController < ApplicationController
  before_action :set_mail

  def create
    if @mail.update welcome_mail_params
      gflash success: 'Email template updated.'
      redirect_to settings_url
    else
      gflash error: 'There was a problem while updating email template.'
      redirect_to settings_url
    end
  end

  def update
    if @mail.update welcome_mail_params
      gflash success: 'Email template updated.'
      redirect_to settings_url
    else
      gflash error: 'There was a problem while updating email template.'
      redirect_to settings_url
    end
  end

  private

  def welcome_mail_params
    params.require(:welcome_mail).permit(:subject, :body)
  end

  def set_mail
    @mail = WelcomeMail.pull
  end

end
