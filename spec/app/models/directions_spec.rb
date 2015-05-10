require 'spec_helper'

describe OnTheWay::Directions do
  include Rack::Test::Methods

  subject { described_class.new(params) }

  describe "#route" do

    context "from points to a route" do

      let (:params) { {start_address: "start_address", end_address: "end_address"} }


      it "initializes with two point objects" do

        OnTheWay::Point.stub(:new) { 'thing' }
        OnTheWay::MapquestDirections.stub(:new).with('thing', 'thing') do
          OpenStruct.new(find_route: "Route")
        end

        expect(subject.route).to eq('Route')
      end
    end
  end
end

