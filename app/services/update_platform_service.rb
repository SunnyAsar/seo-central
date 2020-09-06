require 'faraday'
require 'json'

class UpdatePlatformService
  attr_accessor :venue

  def initialize(venue_id)
    @venue = Venue.find(venue_id)
  end

  def update_platforms
    @venue.platforms.each do |platform|
      data = data_object(platform)
      url = "https://rails-code-challenge.herokuapp.com/#{platform.name}/venue?api_key=#{ENV['API_KEY']}"
      Faraday.patch(url, { venue: data })
    end
  end

  private

  def data_object(platform)
    case platform.name
    when 'platform_a'
      platform_a
    when 'platform_b'
      platform_b
    when 'platform_c'
      platform_c
    end
  end

  def platform_a
    {
      name: venue.name, address: venue.primary_address,
      category_id: venue.category_id, lat: venue.lat,
      lng: venue.lng, closed: venue.closed, hours: venue.hours
    }
  end

  def platform_b
    {
      name: venue.name, street_address: venue.primary_address,
      lat: venue.lat, lng: venue.lng, closed: venue.closed,
      hours: venue.hours, category_id: venue.category_id
    }
  end

  def platform_c
    {
      name: venue.name, address_line_1: venue.primary_address,
      address_line_2: venue.other_address,
      website: venue.website, phone_number: venue.phone,
      lat: venue.lat, lng: venue.lng, closed: venue.closed,
      hours: venue.hours
    }
  end
end
