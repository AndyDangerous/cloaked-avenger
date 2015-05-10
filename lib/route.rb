module OnTheWay
  class Route
    attr_reader :shape

    def initialize(shape_points)
      @shape = geojson(shape_points)
    end

    def geojson(shape_points)
      GeoJSONBuilder.build(shape_points)
    end
  end

  module GeoJSONBuilder
    def self.build(points)
      <<-JSON
      {
        "type": "LineString",
        "coordinates": [
        #{iterate_and_print_points(points)}
        ]
      }
      JSON
    end

    def self.iterate_and_print_points(points)
      str = ''
      while points.length > 0 do
        lat = points.shift
        lng = points.shift
        str << "[#{lng}, #{lat}]"
        str << ", " if points.length > 0
      end
      str
    end

  end
end
