class SessionsController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
  end

  def create
    @moderator = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    if @moderator
      session[:current_moderator] = @moderator
      gflash success: 'You have succesfully sing in'
      redirect_to users_url
    else
      gflash notice: 'Username or password does not match'
      render 'new'
    end
  end

  def destroy
    session[:current_moderator] = nil
    gflash notice: 'You have successfully sign out'
    redirect_to '/login'
  end

end
