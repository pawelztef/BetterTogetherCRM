class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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
    @clients = Client.all
    @dogs = Dog.all
    @volunteers = Volunteer.all

    @event = Event.new
    @note = Note.new
    @custom_event = CustomEvent.new

    @custom_event.notes << @note
    @event.custom_events << @custom_event
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
      @event = Event.new(event_params)
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
    respond_to do |format|
      if @event.update(event_params)
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
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:options, :start, :end, :title,
                                 visits_attributes: [],
                                 custom_events_attributes: [:description ] )
  end
end
