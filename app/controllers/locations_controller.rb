class LocationsController < ApplicationController
  before_action :location, only: [:edit, :show, :update, :destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @locations = Location.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @location = Location.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

  def destroy
    if @location.destroy
      redirect_to locations_path
    else
      redirect_to locations_path
    end
  end

private

  def location_params
    params.require(:location)
      .permit(
        :name,
        :distance,
        :date
      )
  end

  def location
    @location = Location.find_by(id: params[:id])
  end

end
