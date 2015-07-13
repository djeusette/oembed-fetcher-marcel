require File.expand_path('../config/environment', __FILE__)

producer = OEmbedFetcher::Producers::MessageProducer.new
producer.publish
