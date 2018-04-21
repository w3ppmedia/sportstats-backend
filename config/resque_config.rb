require 'resque'

config = ENV.fetch("REDIS_URL", "127.0.0.1:6379")
Resque.redis = config