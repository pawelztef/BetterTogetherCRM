class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @volunteers = Volunteer.all
  end

  def show
    @membership = @volunteer.volunteers_groups.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @volunteer = Volunteer.new
  end

  def edit
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      gflash success: 'Volunteer was successfully created.'
      redirect_to volunteers_url
    else
      gflash error: 'There was a problem while creating volunteer.'
      render 'new'
    end
  end

  def update
    if @volunteer.update(volunteer_params)
      gflash success: 'Volunteer was successfully updated.'
      redirect_to volunteers_url
    else
      gflash error: 'There was a problem while updating volunteer.'
      render 'new'
    end
  end

  def destroy
    @volunteer.destroy
    gflash success: 'Volunteer was successfully deleted.'
    redirect_to volunteers_url
  end

  private
  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :phone1, :phone2, :volunteers_group_ids => [])
  end
end
