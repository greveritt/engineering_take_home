require "rails_helper"

RSpec.describe Api::V1::ClientsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/clients").to route_to("api/v1/clients#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/clients/1").to route_to("api/v1/clients#show", id: "1")
    end
  end
end
