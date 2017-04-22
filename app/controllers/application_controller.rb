class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_moderator

  def current_moderator
    @moderator ||= User.find(session[:current_moderator]['id']) if session[:current_moderator]
  end

  def authorize
    unless current_moderator
      redirect_to '/login'
    end
  end

  def require_owner
    unless current_moderator.owner?
      gflash warning: "You are not authorized"
      redirect_to '/'
    end
  end

  rescue_from Exceptions::FileExtensionException do |exception|
    flash[:file_exceptions] = exception.message
    render :new
  end

  rescue_from Exceptions::NoFileException do |exception|
    flash[:file_exceptions] = exception.message
    render :new
  end
  rescue_from Exceptions::InvalidHeadersException do |exception|
    flash[:file_exceptions] = exception.message
    render :new
  end

end
