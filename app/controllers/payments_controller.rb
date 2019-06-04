class PaymentsController < ApplicationController
  before_action :set_booking


  def create
      customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

    charge = Stripe::Charge.create(
      customer:     customer.id, # You should store this customer id and re-use it.
      amount:       @booking.amount_cents,
      description:  "Payment for flights booking #{@booking.id}",
      currency:     @booking.amount.currency
    )

    @booking.update(payment: charge.to_json, state: 'paid')
    authorize @booking
    redirect_to confirmation_booking_path(@booking)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to booking_payments_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
