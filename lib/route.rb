module OnTheWay
  class Route
    attr_reader :shape

    def initialize(shape_points)
      @shape_points = shape_points
      @shape = geojson
    end

    def geojson
      GeoJSONBuilder.build(@shape_points)
    end
  end

  module GeoJSONBuilder
    def self.build(points)
      {'type' => 'LineString', 'coordinates' => iterate_and_print_points(points) }
    end

    def self.iterate_and_print_points(points)
      ary = []
      while points.length > 0 do
        lat = points.shift
        lng = points.shift
        ary << [lng, lat]
      end
      ary
    end

  end
end
