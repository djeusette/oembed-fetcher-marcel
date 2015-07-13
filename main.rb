require File.expand_path('../config/environment', __FILE__)

options = {
  enable_http_api_use: false
}

config = {
  mq_username: 'guest',
  mq_password: 'guest',
  mq_host: 'localhost',
  mq_port: 5672,
  mq_exchange: 'messages',
  autoload_rails: false
}

def load_config_from_file(file)
  File.open(file) { |fp| Marcel::Config.load_from_file(fp) }
end

def load_config_from_hash(hash)
  Marcel::Config.initialize(hash)
end

def load_config
  begin
    load_config_from_file("config/marcel.yaml")
  rescue Errno::ENOENT
    load_config_from_hash(config)
  end
end

EMBEDLY_API_KEY = ENV["EMBEDLY_API_KEY"]
load_config

OEmbedFetcher.initialize EMBEDLY_API_KEY

Marcel.initialize(options)
Marcel.start("oembed.request")
