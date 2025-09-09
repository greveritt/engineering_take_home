require 'rails_helper'

RSpec.describe "Api::V1::Client::Buildings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/client/buildings/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/client/buildings/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/client/buildings/update"
      expect(response).to have_http_status(:success)
    end
  end

end
