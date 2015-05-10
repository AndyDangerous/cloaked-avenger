module OnTheWay
  class Point
    attr :latitude, :longitude, :location

    def initialize(locator)
      result = Geocoder.search(locator).first
      @latitude = result.data['geometry']['location']['lat']
      @longitude = result.data['geometry']['location']['lng']
    end
  end
end
