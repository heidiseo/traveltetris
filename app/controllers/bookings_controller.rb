class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @booking = Booking.all
  end

  def new
    @flights_ids = params[:flight].split(",") # -> return string
    # split the string by comma into array
    # iterete over rarray with each
    # find flight instance with .find and id
    @flights = []
    @flights_ids.each do |flight_id|
      @flights << Flight.find(flight_id)
    end
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    authorize @booking
    raise
    if @booking.save
      # flight_bookings.create()
      redirect_to edit_booking_path(@booking)
    else
      render :new
    end
  end

  def edit #edit_booking_path
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:title, :first_name, :last_name, :email, :passport, :nationality, :dob)
  end
end
