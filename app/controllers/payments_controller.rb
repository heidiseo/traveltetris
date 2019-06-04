class PaymentsController < ApplicationController
  # before_action :set_booking

  def create
    raise
    # ...
  end

private

  def set_booking
    # @booking = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
