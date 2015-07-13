require "marcel"

module OEmbedFetcher
  module Consumers

    class OEmbedRequestConsumer
      include Marcel::EventHandler

      on_event 'oembed request' do |event|
        retrieve_oembed(event[:data]) if event[:data]
      end

      private

        def self.retrieve_oembed(params)
          response_objects = embedly_client.oembed params
          result = response_objects.collect{ |object| object.marshal_dump }
          printf "Oembed result: %s\n", result.inspect
        end

        def self.embedly_client
          OEmbedFetcher.embedly_client
        end

    end
  end
end
