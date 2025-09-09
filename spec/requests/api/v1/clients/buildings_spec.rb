require 'rails_helper'

RSpec.describe "/api/v1/clients/:client_id/buildings/(:id)", type: :request do
  let(:client) { create(:client) }
  # This should return the minimal set of attributes required to create a valid
  # Building. As you add validations to Building, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attrs = attributes_for(:building, client_id: client.id)
    attrs.delete(:client)
    attrs
  }
  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # BuildingsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "updates the requested building" do
        post "/api/v1/clients/#{client.id}/buildings",
              params: { building: valid_attributes }, headers: valid_headers, as: :json
        building = Building.last
        expect(building.address1).to eq valid_attributes[:address1]
      end

      it "renders a JSON response with the building" do
        post "/api/v1/clients/#{client.id}/buildings",
              params: { building: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the building" do
        post "/api/v1/clients/#{client.id}/buildings",
              params: { building: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attrs = attributes_for(:building, client_id: client.id)
        attrs.delete(:id)
        attrs.delete(:client)
        attrs
      }

      it "updates the requested building" do
        building = Building.create! valid_attributes
        patch api_v1_client_building_url(building),
              params: { building: new_attributes }, headers: valid_headers, as: :json
        building.reload
        expect(building.address1).to eq new_attributes[:address1]
      end

      it "renders a JSON response with the building" do
        building = Building.create! valid_attributes
        patch "/api/v1/clients/#{building.client.id}/buildings/#{building.id}",
              params: { building: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the building" do
        building = Building.create! valid_attributes
        patch api_v1_client_building_url(building),
              params: { building: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
