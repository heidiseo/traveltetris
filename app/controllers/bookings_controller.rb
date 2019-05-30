class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped
  def index
    skip_authorization

  def new
  end

  def create
  end

  def edit #edit_booking_path
    # redirect_to confirmation page
  end

  def update
  end
end
