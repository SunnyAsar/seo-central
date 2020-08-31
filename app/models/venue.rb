# fronzen-string
class Venue < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :primary_address, presence: true
  validates :lat, :lng, presence: true
  validates :closed, presence: true

  has_and_belongs_to_many :platforms
end
