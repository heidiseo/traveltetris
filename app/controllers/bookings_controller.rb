class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @booking = Booking.all
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
    authorize @booking
    if @booking.save
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
