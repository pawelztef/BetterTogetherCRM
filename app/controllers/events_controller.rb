class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_tables, only: [:new, :show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_note
    @event.build_custom_event
    @event.build_visit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit

    set_edit_view

  end

  def create
    @event = Event.new(event_params)
    case params[:options]
      when "1"
        if @event.custom_event.present?
          @event.custom_event.dog_ids = params[:dog_ids] 
          @event.custom_event.client_ids = params[:client_ids] 
          @event.custom_event.volunteer_ids = params[:volunteer_ids] 
        end
      when "2"
      when "3"
      when "4"
        @event.build_visit
        @event.visit.volunteer = Volunteer.find params[:visitor_id]
        @event.visit.client = Client.find params[:visited_id]
    end
    respond_to do |format|
      if @event.save
        format.html
        format.js
        format.json
      else
        format.html
        format.js
        format.json
      end
    end
  end

  def update
    @event.attributes = event_params
    if @event.custom_event.present?
      @event.custom_event.dog_ids = params[:dog_ids] || @dog_ids
      @event.custom_event.client_ids = params[:client_ids] || @client_ids
      @event.custom_event.volunteer_ids = params[:volunteer_ids] || @volunteer_ids
    elsif @event.visit.present?
      @event.visit.volunteer_id = params[:visitor_id] || @visitor_id
      @event.visit.client_id = params[:visited_id] || @visited_id
    end
    respond_to do |format|
      if @event.save
        format.html
        format.js
        format.json
      else
        format.html
        format.js
        format.json
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_edit_view
    if @event.custom_event.present?
      params[:options] = 1

      #Uncomment after rest models implemented

      # elsif @event.training.present?
      #   params[:options] = 2
      # elsif @event.transfer.present?
      #   params[:options] = 3


      elsif @event.visit.present?
        params[:options] = 4
      end
  end

  def set_event
    @event = Event.find(params[:id])
    if @event.custom_event.present?
      @dog_ids = @event.custom_event.dog_ids 
      @client_ids = @event.custom_event.client_ids
      @volunteer_ids = @event.custom_event.volunteer_ids
    elsif @event.visit.present?
      @visitor_id = @event.visit.volunteer_id
      @visited_id = @event.visit.client_id
    end
  end

  def set_tables
    @clients = Client.all
    @dogs = Dog.all
    @volunteers = Volunteer.all
  end

  def event_params
    params.require(:event).permit(:id, :options, :start, :end, :title, 
                                  note_attributes: [:id, :content],
                                  custom_event_attributes: [:id, :description, dog_ids: [], client_ids: [], volunteer_ids: []],
                                  visit_attributes: [:volunteer_id, :client_id])
  end
end
