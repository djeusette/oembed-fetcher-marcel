class EmbedlyClient

  def initialize(api_key)
    @embedly_api = Embedly::API.new key: api_key
  end

  def oembed(params)
    @embedly_api.oembed params
  end

end
