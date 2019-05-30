class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new]
  def index
    @plans = policy_scope(Plan)
  end

  def show
  end

  def new
    @plan = Plan.new
    authorize @plan
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user
    authorize @plan
    if @plan.save
      redirect_to edit_plan_path(@plan)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:plan]
      @cities = params[:plan][:city_ids].reject(&:blank?).map { |id| City.find(id) }
      @plan.cities = @cities
    end
    if params[:trip_dates]
      start_dates = params[:trip_dates][:start_dates]
      end_dates = params[:trip_dates][:end_dates]
      start_dates.size.times do |c|
        departure_date = start_dates[c]
        arrival_date = end_dates[c]
        TripDate.create(plan: @plan, departure_date: departure_date, arrival_date: arrival_date)
      end
    end
    if @plan.save
      if @plan.cities.any? && @plan.trip_dates.any?
        redirect_to api_plan_flights_path(@plan)
      else
        redirect_to edit_plan_path(@plan)
      end
    else
      render :edit
    end
  end


  # def update
  #   if @plan.update(plan_params)
  #     @cities = params[:plan][:city_ids].reject(&:blank?).map { |id| City.find(id) }
  #     @plan.cities = @cities
  #     if @plan.cities.blank? || @plan.trip_dates.blank?
  #       redirect_to edit_plan_path(@plan)
  #     else
  #       redirect_to api_flights_path
  #     end
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
    authorize @plan
  end

  def plan_params
    params.require(:plan).permit(:city_id)
  end
end
