class UpdatePlatformService
  include HTTParty
  attr_accessor :venue

  def initialize(venue_id)
    @venue = Venue.find(venue_id)
  end

  def update_platforms
    puts "here about to update the platform #{venue}"
    @venue.platforms.each do |platform|

      data = data_object(platform)
      url = "https://rails-code-challenge.herokuapp.com/#{platform.name}/venue?api_key=#{ENV['API_KEY']}"
      request = HTTParty.patch(url.to_s, { 
        body: [{ venue: data_object }].to_json,
        headers: {
        'Content-Type': 'application/json'
        } })
      JSON.parse(resquest.body)
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
    else
      nil
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
      hours: venue.hours, category_id: venue.category_id,
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
