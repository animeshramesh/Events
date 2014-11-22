class ShowtimesController < ApplicationController
  before_action :set_showtime, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @showtimes = Showtime.all
    respond_with(@showtimes)
  end

  def show
    respond_with(@showtime)
  end

  def new
    @showtime = Showtime.new
    respond_with(@showtime)
  end

  def edit
  end

  def create
    @showtime = Showtime.new(showtime_params)
    @showtime.save
    respond_with(@showtime)
  end

  def update
    @showtime.update(showtime_params)
    respond_with(@showtime)
  end

  def destroy
    @showtime.destroy
    respond_with(@showtime)
  end

  private
    def set_showtime
      @showtime = Showtime.find(params[:id])
    end

    def showtime_params
      params.require(:showtime).permit(:eventID, :locID, :date, :time, :cost)
    end
end
