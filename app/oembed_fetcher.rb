module OEmbedFetcher

  def self.initialize(embedly_api_key)
    @embedly_client = Services::EmbedlyClient.new embedly_api_key
  end

  def self.embedly_client
    @embedly_client
  end

end
