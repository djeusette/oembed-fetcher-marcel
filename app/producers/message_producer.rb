require "hutch"

module OEmbedFetcher
  module Producers
    class MessageProducer

      def initialize
        Hutch::Config.set(:mq_exchange, "messages")
        Hutch.connect
      end

      def publish
        30.times do |i|
          message = {
            name: "oembed request",
            data: {
              url: "http://www.djump.in"
            }
          }
          Hutch.publish("oembed.request", message)
        end
      end

    end
  end
end
