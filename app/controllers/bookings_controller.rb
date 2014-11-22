class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  

  def book

  end

  def results
    city = params['city']
    theatre =  params['theatre']
    movie = params['movie']

    city_id = City.where(name: city).first.id
    theatre_id = Cinema.where(name: theatre).first.id
    movie_id = Movie.where(title: movie).first.id
    @shows = Show.where(theatreID: theatre_id, movieID: movie_id)

  end

  def pay
    @show = Show.find(params['form']['show_id'])
    @movie = Movie.find(@show.movieID).title
    @theatre = Cinema.find(@show.theatreID).name
  end

  def final 
    puts params
    @show = Show.find(params['show'])
    seats = params['seat_count']

    b = Booking.new
    b.email = current_user.email
    b.movieID = @show.movieID
    b.theatreID = @show.theatreID
    b.date = @show.date
    b.time = @show.time
    b.seats = seats
    b.cost = @show.cost
    b.save

    redirect_to '/'
  end

  def index
    @bookings = Booking.where(email: current_user.email)
    #respond_with(@bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    respond_with(@booking)
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:email, :movieID, :theatreID, :date, :time, :seats, :cost)
    end
end
