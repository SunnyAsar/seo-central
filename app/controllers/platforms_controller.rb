class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms, status: :ok
  end

  def create
    puts 'creating'
    @platform = Platform.new(platform_params)
    if @platform.save
      render json: @platform, status: :ok
    else
      render json: { error: @platform.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def platform_params
    params.require(:platform).permit(:name)
  end
end
