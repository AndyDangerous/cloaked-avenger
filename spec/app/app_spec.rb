require 'spec_helper'

describe OnTheWay::API do
  include Rack::Test::Methods

  let!(:app) { described_class }

  describe "POST /directions" do

    context "getting a directions shape between two points" do

      let (:response) { JSON.parse(last_response.body) }

      let (:query) { {start_address: "Denver, CO", end_address: "Golden, CO"} }

      it "returns a GeoJSON of the route between the points" do

        post "/directions", query.to_json, {'CONTENT_TYPE' => 'application/json'}

        expect(last_response.status).to eq(201)

        expect(response["type"]).to eq("LineString")
        expect(response["coordinates"].class).to eq(Array)
      end

      context "handle errors" do
        it "returns a message indicating invalid params" do
          post "/directions"

          expect(last_response.status).to eq(400)
          expect(response).to eq({"error"=>"start_address is missing, end_address is missing"})
        end
      end
    end
  end
end
