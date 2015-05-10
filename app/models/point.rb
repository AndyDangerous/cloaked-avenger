module OnTheWay
  class Point
    attr :latitude, :longitude, :location

    def initialize(locator)
      result = Geocoder.search(locator)
      @latitude = result.first.data['geometry']['location']['lat']
      @longitude = result.first.data['geometry']['location']['lng']
    end
  end
end
