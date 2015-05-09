Geocoder.configure(

  # geocoding service (see below for supported options):
  lookup: :mapquest,

  :mapquest => { :api_key => ENV['MAPQUEST_API_KEY'] },
  # IP address geocoding service (see below for supported options):
  :ip_lookup => :freegeoip,

  # caching (see below for details):
  # :cache => Redis.new,
  # :cache_prefix => "..."

)
