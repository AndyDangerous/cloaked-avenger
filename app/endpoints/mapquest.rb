module OnTheWay
  class MapquestDirections
    include Endpoint

    def initialize(start_point, end_point)
      @start_point = start_point
      @end_point   = end_point
    end

    def url
      "/directions/v2/route?key=#{mapquest_api_key}&ambiguities=ignore&from=#{start_location}&to=#{end_location}&#{options}"
    end

    def query_base_url
      'http://open.mapquestapi.com'
    end

    def mapquest_api_key
      ENV['MAPQUEST_API_KEY']
    end

    def start_location
      "#{@start_point.latitude},#{@start_point.longitude}"
    end

    def end_location
      "#{@end_point.latitude},#{@end_point.longitude}"
    end

    def options
      "narrativeType=none&routeType=bicycle&fullShape=true&outShapeFormat=raw"
    end

    def find_route
      json = JSON.parse(response.body)
      Route.new(json['route']['shape']['shapePoints'])
    end
  end
end
