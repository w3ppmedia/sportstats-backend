unless defined? USE_LOCAL_REDIS
  USE_LOCAL_REDIS = ENV['USE_LOCAL_REDIS'].present? && ENV['USE_LOCAL_REDIS'] == 'true'
end

class RedisLocator
  @redis_client = nil

  def self.use_alternate_implementation(implementation)
    @redis_client = implementation
  end

  def self.redis
    unless @redis_client
      if ENV['REDIS_URL']
        uri = URI.parse ENV['REDIS_URL']
        if uri.scheme == 'rediss'
          @redis_client = Redis.new(url: uri, ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_PEER })
        else
          @redis_client = Redis.new(host: uri.host, port: uri.port, password: uri.password)
        end
      elsif Rails.env.development? && USE_LOCAL_REDIS
        @redis_client = Redis.new(host: 'localhost', port: 6379)
      end
    end
    @redis_client
  end
end

# force initialization
RedisLocator.redis
