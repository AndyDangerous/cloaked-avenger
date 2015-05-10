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
end
