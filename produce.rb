require File.expand_path('../config/environment', __FILE__)

producer = OEmbedFetcher::MessageProducer.new

producer.publish
