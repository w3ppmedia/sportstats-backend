module Crowdscore
  class Request
    def initialize
      @base_uri = 'api.crowdscores.com'
      @version = 'v1'
    end

    def process(query_string, verb: :get)
      request = Typhoeus::Request.new(
        "#{@base_uri}/#{@version}/#{query_string}",
        method: verb,
        headers: { 'x-crowdscores-api-key' => '5934f2a3dab74fb4acf6c7c69fb21b41'}
      )

      request.run
    end
  end
end
