module OnTheWay
  class Directions
    def initialize(params)
      @ady = params[:start_address]
      @start_point = Point.new(params[:start_address])
      @end_point = Point.new(params[:end_address])
    end

    def directions
      "Here are the directions between #{@ady}(#{@start_address.latitude}, #{@start_address.longitude})"
    end

    def route
      Mapquest.new(@start_point, @end_point).directions
    end

  end

  class Mapquest

    def initialize(start_point, end_point)
      @start_point = start_point
      @end_point   = end_point
    end

    def url
      "/directions/v2/route?key=#{mapquest_api_key}&ambiguities=ignore&from=#{start_location}&to=#{end_location}&#{options}"
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

    def directions
      response = conn.get(url)
      json = JSON.parse(response.body)
      json['route']['shape']['shapePoints']
    end

    def conn
      Faraday.new(:url => 'http://open.mapquestapi.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end


