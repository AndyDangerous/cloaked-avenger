module OnTheWay
  class Directions
    attr_reader :route

    def initialize(params)
      @start_point = Point.new(params[:start_address])
      @end_point = Point.new(params[:end_address])
    end

    def route
      @route ||= MapquestDirections.new(@start_point, @end_point).find_route
    end

    def buffer
      #todo: implement route buffering
      #should output a polygon
    end
  end
end
