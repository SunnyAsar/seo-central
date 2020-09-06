# fronzen-string
class Venue < ApplicationRecord

  validates :name, presence: true, length: { minimum: 3 }
  validates :primary_address, presence: true
  validates :lat, :lng, presence: true
  validates :closed, presence: true
  validates :category_id, presence: true

  has_and_belongs_to_many :platforms

  def get_data(platform)
    url = "https://rails-code-challenge.herokuapp.com/#{platform}/venue?api_key=#{ENV['API_KEY']}"
    resquest = Faraday.get url
    resquest.body
  end
end
