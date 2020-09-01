require 'rails_helper'

RSpec.describe VenuesController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Venue #create' do
    it 'fails to create a venue with invalid data' do
      post :create, params: { venue:{ name: '', primary_address: 'on the go',
                                      other_address: 'another plce',
                                      website: 'theplace.com', phone: '01823522271',
                                      lat: '', lng: '9.34532', closed: false,
                                      hours: '', category_id: '' }}
      expect(response).not_to have_http_status(:success)
    end
  end

end
