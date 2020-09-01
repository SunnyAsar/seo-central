require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:primary_address) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
    it { should validate_presence_of(:closed) }
    it { should validate_presence_of(:category_id) }
  end
end
