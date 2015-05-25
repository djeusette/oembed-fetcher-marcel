require "hutch"

module OEmbedFetcher

  API_KEY = "baee6e5342524c9ba5a77a6c6dfb2ee6"

  class OEmbedRequestConsumer
    include Hutch::Consumer
    consume 'oembed.request'

    def initialize
      @embedly_client = EmbedlyClient.new API_KEY
    end

    def process(message)
      retrieve_oembed(message.body)
    end

    def retrieve_oembed(params)
      response_objects = @embedly_client.oembed params
      result = response_objects.collect{ |object| object.marshal_dump }
      produce_result_message(result)
    end

    def produce_result_message(message_body)
      Hutch.connect
      Hutch.publish("oembed.result", message_body)
    end

  end

end
