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
        headers: { 'x-crowdscores-api-key' => '5934f2a3dab74fb4acf6c7c69fb21b41'}
      )

      request.run
    end
  end
end
