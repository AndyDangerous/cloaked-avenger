module OnTheWay
  class Point
    attr :latitude, :longitude, :location, :address

    def initialize(address)
      @address = address
      result = Geocoder.search(address)
      @latitude = result.first.data['geometry']['location']['lat']
      @longitude = result.first.data['geometry']['location']['lng']
    end

    def self.locate!
      # geocode address
    end
  end
end
