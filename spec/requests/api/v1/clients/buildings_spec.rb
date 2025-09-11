require 'rails_helper'

RSpec.describe "/api/v1/clients/:client_id/buildings/(:id)", type: :request do
  let(:client) { create(:client) }
  let!(:custom_enum_fields) { create_list(:custom_enum_field, 2, client: client) }
  let!(:custom_enum_field_choices) { custom_enum_fields.flat_map { |field| create_list(:custom_enum_field_choice, 2, custom_enum_field: field) } }
  # let!(:custom_enum_field_values) { custom_enum_field_choices.map { |choice| create_list(:custom_enum_field_value, 2, custom_enum_field_choice: choice) } }
  let!(:custom_number_fields) { create_list(:custom_number_field, 2, client: client) }
  # let!(:custom_number_field_values) { custom_number_fields.map { |field| CustomNumberFieldValue.create!(value: Faker::Number.number, custom_number_field: field, building: building) } }
  let!(:custom_freeform_fields) { create_list(:custom_freeform_field, 2, client: client) }
  # let!(:custom_freeform_field_values) { custom_freeform_fields.map { |field| CustomFreeformFieldValue.create!(value: Faker::Adjective.positive, custom_freeform_field: field, building: building) } }
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
    {
      'Content-Type': 'application/json'
    }
  }
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates the requested building" do
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

      describe "custom fields" do
        subject(:create_with_field) do
           post "/api/v1/clients/#{client.id}/buildings",
              params: { building: attributes }, headers: valid_headers, as: :json
        end
        describe "number fields" do
          let(:custom_number_field) { custom_number_fields.sample }
          let(:value) { Faker::Number.number }
          let(:attributes) do
            attributes_for(:building, custom_number_field_values: { custom_number_field.id => value })
          end

          it "creates a building with the number value" do
            create_with_field

            expect(Building.last.custom_number_field_values.first).to have_attributes(custom_number_field: custom_number_field, value: value)
          end
        end

        describe "enum fields" do
          let(:custom_enum_field_choice) { custom_enum_field_choices.sample }
          let(:attributes) do
            attributes_for(:building, custom_enum_field_values: [ custom_enum_field_choice.id ])
          end

          it "creates a building with the enum value" do
            create_with_field

            building = Building.last
            expect(building.custom_enum_field_values.first.custom_enum_field_choice_id).to eq custom_enum_field_choice.id
          end
        end
        describe "freeform fields" do
          let(:custom_freeform_field) { custom_freeform_fields.sample }
          let(:value) { Faker::Adjective.negative }
          let(:attributes) do
            attributes_for(:building, custom_freeform_field_values: { custom_freeform_field.id => value })
          end

          it "creates a building with the freeform value" do
            create_with_field

            expect(Building.last.custom_freeform_field_values.first).to have_attributes(custom_freeform_field: custom_freeform_field, value: value)
          end
        end
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        attrs = valid_attributes
        attrs
      end
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
