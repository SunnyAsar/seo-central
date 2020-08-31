class Platform < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  has_and_belongs_to_many :venues
end
