class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  def current_moderator
    @moderator ||= User.find(session[:current_moderator]['id']) if session[:current_moderator]
  end
  
  def authorize
    unless current_moderator
      gflash notice: "Please login before go to view pages"
      redirect_to '/login'
    end
  end

end
