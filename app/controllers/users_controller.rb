class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:new, :create]
  before_action :secure_consistency, only: [:edit, :update, :destroy]

  def index
    usr = User.find current_moderator.id 
    @users = usr.owner? ? User.all : [usr]
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to users_url, notice: 'User was succesfully created.'
      gflash :success => 'User was succesfully created.'
      redirect_to users_url
    else
      # flash[:alert] = 'There was a problem while creating user.'
      gflash :now, :error =>'There was a problem while creating user.'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      gflash :success => 'User was succesfully updated.'
      redirect_to users_url
    else
      gflash :now, :error =>'There was a problem while updating user.'
      render :new
    end
  end

  def destroy
    @user.destroy
    gflash :success => 'User was succesfully deleted.'
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def set_user
    @user = User.find params[:id]
  end

  def secure_consistency
    if @user != current_moderator && !current_moderator.owner?
      # byebug
      gflash warning: 'You are not authorized'
      redirect_to '/'
    end
  end

end
