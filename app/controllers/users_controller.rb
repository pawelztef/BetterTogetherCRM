class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:new, :create]
  before_action :secure_consistency, only: [:edit, :update, :destroy]

  def index
    usr = User.find current_moderator.id 
    @users = usr.owner? ? User.includes(:location).all.order('id DESC') : [usr]
    respond_to  do |format| 
      format.html
      format.csv{ send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
  end

  def new
    @user = User.new
    @user.location = Location.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      gflash :success => 'User was succesfully created.'
      redirect_to users_url
    else
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
    if @user.owner?

      gflash :warning => "Owner can't delete itself"
      redirect_to users_url
    else
      @user.destroy
      gflash :success => 'User was succesfully deleted.'
      redirect_to users_url
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 location_attributes: [:line1, :line2, :city, :county,
                                                       :code, :latitude, :longitude,
                                                       :localizable_id, :localizable_type])
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
