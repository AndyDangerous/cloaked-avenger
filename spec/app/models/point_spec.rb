require 'spec_helper'

describe OnTheWay::Point do
  include Rack::Test::Methods

  describe "a new point" do

    subject { described_class.new(params) }
    let (:params) { 'locator' }

    it "responds to latitude, longitude" do

      Geocoder.stub(:search) do
        foo = OpenStruct.new({data: {'geometry' => {'location' => {'lat' => 'lat', 'lng' => 'lng'} } }})
        [foo]
      end

      expect(subject.latitude).to eq('lat')
      expect(subject.longitude).to eq('lng')
    end
  end
end

