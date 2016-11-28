class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: 'User was succesfully created.'
    else
      flash[:alert] = 'There was a problem while creating user.'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to users_url, notice: 'User was succesfully updated.'
    else
      flash[:alert] = 'There was a problem while updating user.'
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was succesfully deleted'
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def set_user
    @user = User.find params[:id]
  end

end
