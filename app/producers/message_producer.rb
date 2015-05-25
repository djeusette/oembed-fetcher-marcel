require "hutch"

module OEmbedFetcher

  class MessageProducer

    def initialize
      Hutch.connect
    end

    def publish
      2.times do |i|
        message = {
          url: "http://www.djump.in"
        }
        Hutch.publish("oembed.request", message)
      end
    end

  end

end
