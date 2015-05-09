require File.expand_path('../environment', __FILE__)

module API
end

# require 'app/helpers/route_helpers'
# require 'app/doc/sample_requests'
# require 'app/api/base'
# require 'app/representers/base_representer'
# require 'newrelic-grape'

# Dir["#{File.dirname(__FILE__)}/app/models/extensions/**/*.rb"].each {|f| require f}
# Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each {|f| require f}

# ActiveRecord::Base.instance_eval do
#   include ActiveModel::MassAssignmentSecurity
#   attr_accessible []
# end


ApplicationServer = Rack::Builder.new {
  if ['production', 'staging'].include? Application.config.env
    use Rack::SslEnforcer
  end

  run App
}
