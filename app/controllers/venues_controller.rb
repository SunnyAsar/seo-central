class VenuesController < ApplicationController

  before_action :set_venue, only: :show

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

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :primary_address, :other_address,
                                  :website, :phone_number, :lat, :lng, :closed,
                                  :hours, :category_id)
  end
end
