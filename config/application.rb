require File.expand_path("../boot", __FILE__)

Bundler.require :default, ENV["ENV"]

Dir[File.expand_path('../../app/**/*.rb', __FILE__)].each do |file|
  require file
end
