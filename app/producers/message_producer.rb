require "hutch"

module OEmbedFetcher

  class MessageProducer

    def initialize
      Hutch.connect
    end

    def publish
      10.times do |i|
        Hutch.publish('example.a', subject: "test #{i}", action: 'received')
      end
    end

  end

end
