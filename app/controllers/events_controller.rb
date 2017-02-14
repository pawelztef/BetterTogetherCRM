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
  end

  def create
    @event = Event.new(event_params)
    @event.custom_event.dog_ids = params[:dog_ids] if @event.custom_event
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
    @event.custom_event.dog_ids = params[:dog_ids] if @event.custom_event
    byebug
    respond_to do |format|
      if @event.update
    byebug
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
  def build_relevant
    case params[:options]
    when "1" #custom
      build_custom_event
    when "2" #training
      build_training
    when "3" #transfer
      build_transfer
    when "4" #visit
      build_visit
    else
      # need to implement
    end
  end

  def build_custom_event
    @custom_event = @event.custom_events.first
    @custom_event.clients << Client.find(params[:clients_ids]) if params[:clients_ids]
    @custom_event.volunteers << Volunteer.find(params[:volunteers_ids]) if params[:volunteers_ids]
    @custom_event.dogs << Dog.find(params[:dogs_ids]) if params[:dogs_ids] 
    # @event.custom_events << @custom_event 
  end

  def build_training
  end

  def build_transfer
  end

  def build_visit
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_tables
    @clients = Client.all
    @dogs = Dog.all
    @volunteers = Volunteer.all
  end

  def event_params
    params.require(:event).permit(:options, :start, :end, :title, 
                                 note_attributes: [:content],
                                 custom_event_attributes: [:description, dog_ids: []],
                                 visit_attributes: [])
  end
end
