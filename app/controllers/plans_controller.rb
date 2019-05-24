class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

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

    if @plan.update(plan_params)
      if @plan.city1.blank? || @plan.city2.blank? || @plan.start_date1.blank? || @plan.start_date2.blank? || @plan.end_date1.blank? || @plan.end_date2.blank?
      # if @plan.cities.blank? || @plan.trip_dates.blank?
        redirect_to edit_plan_path(@plan)
      else
        redirect_to plan_path(@plan)
      end
    else
      render :edit
    end
  end

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
    # params.require(:plan).permit(:city_id)

    params.require(:plan).permit(:city1, :city2, :start_date1, :start_date2, :end_date1, :end_date2)
  end
end
