require "rails_helper"

RSpec.describe ClientsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/clients").to route_to("clients#index")
    end

    it "routes to #show" do
      expect(get: "/clients/1").to route_to("clients#show", id: "1")
    end
  end
end
