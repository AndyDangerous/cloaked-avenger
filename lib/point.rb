class Point
  attr :latitude, :longitude, :location, :address

  # geocoded_by :address
  # after_validation :geocode

  def initialize(address)
    @address = address
  end

  def self.locate!
    # geocode address
  end
end
