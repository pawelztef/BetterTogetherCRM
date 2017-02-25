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
    @event.build_training
    @event.build_custom_event
    @event.build_visit
    @event.build_transfer
    @event.custom_event.note = Note.new
    @event.visit.note = Note.new
    @event.training.note = Note.new
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
        @event.training = nil
        @event.visit = nil
        @event.custom_event.dog_ids = params[:dog_ids] 
        @event.custom_event.client_ids = params[:client_ids] 
        @event.custom_event.volunteer_ids = params[:volunteer_ids] 
      end
      @event.visit = nil
    when "2"
      if @event.training.present?
        @event.custom_event = nil
        @event.visit = nil
        @event.training.dog_id = params[:dog_id]
        @event.training.volunteer_id = params[:volunteer_id]
      end
    when "3"
    when "4"
      @event.custom_event = nil
      @event.training = nil
      @event.visit.volunteer = Volunteer.find params[:volunteer_id]
      @event.visit.client = Client.find params[:client_id]
      @event.custom_event = nil
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
      @event.visit.volunteer_id = params[:volunteer_id] || @visitor_id
      @event.visit.client_id = params[:client_id] || @visited_id
    elsif @event.training.present?
      @event.training.dog_id = params[:dog_id] || @trainee_id
      @event.training.volunteer_id = params[:volunteer_id] || @trainer_id
      # @event.training.other = nil if @vent.training.other.empty?
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

  # POST /events/transfer
  def transfer
    @client = Client.includes(:dogs).where(dogs: {id: params[:dog_id]})
    byebug
    respond_to do |format|
      format.js
    end
  end

  private

  def set_edit_view
    if @event.custom_event.present?
      params[:options] = 1
    elsif @event.training.present?
      params[:options] = 2
      
      #Uncomment after rest models implemented
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
    elsif @event.training.present?
      @trainee_id = @event.training.dog_id
      @trainer_id = @event.training.volunteer_id
    end
  end

  def set_tables
    @clients = Client.all
    @dogs = Dog.all
    @volunteers = Volunteer.all
  end

  def event_params
    params.require(:event).permit(:id, :options, :start, :end, :title, 
                                  custom_event_attributes: [:id, :description, dog_ids: [], client_ids: [], volunteer_ids: [], note_attributes: [:id, :content]],
                                  visit_attributes: [:id, :volunteer_id, :client_id, note_attributes: [:id, :content]],
                                  training_attributes: [:id, :dog_dog, :dog_human, :no_attachment, :ignore_calling, :no_heel, :toilet_home, :bite_furniture, :other, :dog_id, :volunteer_id, note_attributes: [:id, :content]])
  end
end
