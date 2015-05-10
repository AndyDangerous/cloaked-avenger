module OnTheWay
  class Directions
    def initialize(params)
      @start_point = Point.new(params[:start_address])
      @end_point = Point.new(params[:end_address])
    end

    def route
      Mapquest.new(@start_point, @end_point).directions
    end

  end
end
