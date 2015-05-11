require "hutch"

module OEmbedFetcher

  class MessageConsumer
    include Hutch::Consumer
    consume 'example.a'

    def process(message)
      puts "Received message:", message
    end

  end

end
