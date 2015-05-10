module OnTheWay
  class API < Grape::API
    include Grape::ActiveRecord::Extension
    # version 'v1'
    format :json

    helpers do
      def clean_directions_params
        declared(params)
      end
    end

    desc "return directions"
    params do
      requires :start_address, type: String, desc: "Streeet address string"
      requires :end_address, type: String, desc: "Streeet address string"
    end

    post :directions do
      route = Directions.new(clean_directions_params).route

      route.shape
    end

    desc "Healthcheck"
    get :high  do
      status 200
      "Rocky Mountain High"
    end

  end


end
