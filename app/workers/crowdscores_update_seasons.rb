class CrowdscoresUpdateSeasons
  @queue = 'crowdscores_update_seasons'

  def self.perform()
    request = Typhoeus::Request.new(
      "api.crowdscores.com/v1/seasons",
      method: :get,
      headers: { 'x-crowdscores-api-key' => 'efa501a0aa81457db48470c68158e3d0'}
    )

    response = request.run
    process(response.response_body) if response.response_code == 200
  end

  def self.process(json_data)
    seasons = JSON.parse(json_data, object_class: OpenStruct)

    seasons.each do |season|
      Season.new(
        name: season.name,
        crowdscore_dbid: season.dbid
      ).save
    end
  end
end
