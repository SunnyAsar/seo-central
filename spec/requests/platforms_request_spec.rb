require 'rails_helper'

RSpec.describe "Platforms", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/platforms/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/platforms/create"
      expect(response).to have_http_status(:success)
    end
  end

end
