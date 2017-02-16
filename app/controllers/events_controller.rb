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
    @event.custom_event.dog_ids = params[:dog_ids] || @dog_ids
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

  def set_event
    @event = Event.find(params[:id])
    @dog_ids = @event.custom_event.dog_ids
  end

  def set_tables
    @clients = Client.all
    @dogs = Dog.all
    @volunteers = Volunteer.all
  end

  def event_params
    params.require(:event).permit(:id, :options, :start, :end, :title, 
                                 note_attributes: [:id, :content],
                                 custom_event_attributes: [:id, :description, dog_ids: []],
                                 visit_attributes: [])
  end
end
