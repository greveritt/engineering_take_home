module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[ show ]

      # GET /api/v1/clients
      # GET /api/v1/clients.json
      def index
        @clients = ::Client.all
      end

      # GET /api/v1/clients/1
      # GET /api/v1/clients/1.json
      def show
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_client
          @client = ::Client.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def client_params
          params.fetch(:client, {})
        end
    end
  end
end
