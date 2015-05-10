require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RACK_ENV'] = 'test'
require_relative '../application.rb'
require_relative 'vcr_setup'
ActiveRecord::Base.logger.level = Logger::WARN

RSpec.configure do |config|
  # config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: /spec/
  config.before(:each) do
  end
end
