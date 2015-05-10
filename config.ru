require File.expand_path('../application', __FILE__)
use ActiveRecord::ConnectionAdapters::ConnectionManagement

# run Grape::RackBuilder.application
run ApplicationServer
