class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @flights_ids = params[:flight].split(",")
    @flights = []
    @flights_ids.each do |flight_combo|
      flight_combo = flight_combo.split("|")
      @flights << [Flight.find(flight_combo[0]), Flight.find(flight_combo[1])]
    end
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    @booking.plan_id = params[:plan_id]
    authorize @booking
    if @booking.save
      @flights = params[:flight_ids].split(",")
      @flights.each do |flight|
        @flight_pair = []
        flight.split("|").each { |flight| @booking.flight_bookings << FlightBooking.create!(flight_id: flight, booking_id: @booking.id)}
      end
    @counter = 0
    @booking.flights.each do |flight|
      @counter += flight.price_cents
    end
    @booking.amount_cents = @counter * 100 / 2
    @booking.save
      redirect_to edit_booking_path(@booking)
    else
      render :new
    end

  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    # redirect_to confirmation_bookings_path(@booking)
  end

  def confirmation
    @booking = Booking.find(params[:id])
    authorize @booking
    # redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:first_name_passenger, :last_name_passenger, :email, :passport, :nationality, :dob)
  end
end
