module Endpoint
  def verb
    'get'
  end

  def search
    Faraday.new(:url => query_base_url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      # faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def options
    nil
  end

  def response
    search.get(url) if verb == 'get'
  end
end

