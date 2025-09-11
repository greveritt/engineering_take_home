class Api::V1::Clients::BuildingsController < ApplicationController
  protect_from_forgery except: %i[create update destroy]
  before_action :set_building, only: %i[ show update destroy ]

  # GET /api/v1/clients/1/buildings
  # GET /api/v1/clients/1/buildings.json
  def index
    @client = ::Client.find(params[:client_id])
    pagy, @buildings = pagy(@client.buildings)
    @paging_metadata = pagy_metadata(pagy)
  end

  # GET /api/v1/clients/1/buildings/1
  # GET /api/v1/clients/1/buildings/1.json
  def show
  end

  # POST /api/v1/clients/1/buildings
  # POST /api/v1/clients/1/buildings.json
  def create
    @client = ::Client.find(params.require(:client_id))
    @building = Building.new({ client_id: @client.id, **building_params })

    if @building.save
      render :show, status: :ok, template: "api/v1/clients/buildings/show"
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clients/1/buildings/1
  # PATCH/PUT /api/v1/clients/1/buildings/1.json
  def update
    if @building.update(building_params)
      render :show, status: :ok, template: "api/v1/clients/buildings/show"
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/clients/1/buildings/1
  # DELETE /api/v1/clients/1/buildings/1.json
  def destroy
    @building.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      basic_params.to_h.merge(freeform_fields).merge(number_fields).merge(enum_params)
    end

    def basic_params
      params[:building].permit(:address1, :address2, :city, :state, :zip)
    end

    def enum_params
      {
        custom_enum_field_values: params[:building][:custom_enum_field_values]
          &.map do |choice_id|
            CustomEnumFieldValue.new(custom_enum_field_choice: CustomEnumFieldChoice.find(choice_id))
          end
      }
    end

    def freeform_fields
      {
        "custom_freeform_field_values": [].tap do |a|
          params[:building][:custom_freeform_field_values]&.each do |k, v|
            a.push CustomFreeformFieldValue.new(value: v, custom_freeform_field: CustomFreeformField.find(k))
          end
        end
      }
    end

    def number_fields
      {
        "custom_number_field_values": [].tap do |a|
          params[:building][:custom_number_field_values]&.each do |k, v|
            a.push CustomNumberFieldValue.new(value: v, custom_number_field: CustomNumberField.find(k))
          end
        end
      }
    end
end
