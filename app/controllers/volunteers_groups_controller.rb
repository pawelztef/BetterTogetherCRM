class VolunteersGroupsController < ApplicationController
  before_action :set_volunteers_group, only: [:show, :edit, :update, :destroy]

  def index
    @volunteers_groups = VolunteersGroup.all
  
  end

  def show
    @members = @volunteers_group.volunteers.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @volunteers_group = VolunteersGroup.new
  end

  def edit
  end

  def create
    @volunteers_group = VolunteersGroup.new(volunteers_group_params)
    if @volunteers_group.save
      gflash success: 'Volunteers group was successfully created.'
      redirect_to volunteers_groups_url 
    else
      gflash error: 'There was a problem while creating volunteers group.'
      render 'new'
    end
  end

  def update
    if @volunteers_group.update(volunteers_group_params)
      gflash success: 'Volunteers group was successfully updated.'
      redirect_to volunteers_groups_url 
    else
      gflash error: 'There was a problem while updatating volunteers group.'
      render 'new'
    end
  end

  def destroy
    @volunteers_group.destroy
    gflash success: 'Volunteers group was successfully deleted.'
    redirect_to volunteers_groups_url 
  rescue ActiveRecord::DeleteRestrictionError
    number = @volunteers_group.memberships.count
    gflash error: "Can not delete group. You have #{number} members in it."
    redirect_to volunteers_groups_url 
  end

  private
  def set_volunteers_group
    @volunteers_group = VolunteersGroup.find(params[:id])
  end

  def volunteers_group_params
    params.require(:volunteers_group).permit(:name, :description)
  end
end
