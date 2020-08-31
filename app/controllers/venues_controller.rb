class VenuesController < ApplicationController

  before_action :set_venue, only: [:show, :update]
  before_action :set_platformdata, only: :platform_data

  def index
    @venues = Venue.all
    render json: @venues, status: :ok
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      render json: @venue, status: :ok
    else
      render json: { error: @venue.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @venue, status: :ok
  end

  def update
    if @venue.update(venue_params)
      render json: @venue, status: :ok
    else
      render json: { error: @venue.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def platform_data
    data = @venue.get_data(@platform)
    render json: data, status: :ok if data 
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def set_platformdata
    @platform = params[:platform_id]
    @venue = Venue.find(params[:venue_id])
  end

  def venue_params
    params.require(:venue).permit(:name, :primary_address, :other_address,
                                  :website, :phone, :lat, :lng, :closed,
                                  :hours, :category_id)
  end
  
end
