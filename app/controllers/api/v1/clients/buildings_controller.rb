class Api::V1::Clients::BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show update destroy ]

  # GET /api/v1/clients/1/buildings
  # GET /api/v1/clients/1/buildings.json
  def index
    @client = ::Client.find(params[:client_id])
    @buildings = @client.buildings
  end

  # GET /api/v1/clients/1/buildings/1
  # GET /api/v1/clients/1/buildings/1.json
  def show
  end

  # POST /api/v1/clients/1/buildings
  # POST /api/v1/clients/1/buildings.json
  def create
    @building = Building.new(building_params)

    if @building.save
      render :show, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clients/1/buildings/1
  # PATCH/PUT /api/v1/clients/1/buildings/1.json
  def update
    if @building.update(building_params)
      render :show, status: :ok, location: @building
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
      # TODO: whitelist building attributes
      params.fetch(:building, {})
    end
end
