class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @events = Event.all
    respond_with(@events)
  end

  def search
    @event_types = Event.pluck(:eventType)
    #respond_with(@event_types)

  end

  def search_results
    @event_types = Event.pluck(:eventType).uniq
    @selected_types = []

    @event_types.each do |type|
      if params.has_key?(type) 
        print type + " exists! \n"
        @selected_types.push (type)
      end
    end
    event_ids = Event.where(:eventType => @selected_types).pluck(:id).uniq
    @showtimes = Showtime.where(:eventID => event_ids)
    #@showtimes = Showtime.joins('INNER JOIN events ON events.id = showtimes.eventID')


  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:eventType, :name)
    end
end
