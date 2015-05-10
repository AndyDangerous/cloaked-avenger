require 'spec_helper'

describe OnTheWay::Route do
  include Rack::Test::Methods

  describe "#shape" do

    subject { described_class.new(params) }
    let (:params) { [0,0,1,0,1,1,0,1] }

    it "responds to latitude, longitude" do

      Geocoder.stub(:search) do
        foo = OpenStruct.new({data: {'geometry' => {'location' => {'lat' => 'lat', 'lng' => 'lng'} } }})
        [foo]
      end

      expect(subject.shape).to eq({"type"=>"LineString", "coordinates"=>[[0, 0], [0, 1], [1, 1], [1, 0]]})
    end
  end
end

