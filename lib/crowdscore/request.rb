module Crowdscore
  class Request
    def initialize
      @base_uri = 'api.crowdscores.com'
      @version = 'v1'
    end

    def process(query_string)
      request = Typhoeus::Request.new(
        "#{@base_uri}/#{@version}/#{query_string}",
        method: :get,
        headers: { 'x-crowdscores-api-key' => 'efa501a0aa81457db48470c68158e3d0'}
      )

      request.run
    end
  end
end
