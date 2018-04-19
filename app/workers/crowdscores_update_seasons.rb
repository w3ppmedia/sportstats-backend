class CrowdscoresUpdateSeasons
  @queue = 'crowdscores_update_seasons'

  def self.perform()
    request = Crowdscore::Request.new
    response = request.process("seasons")

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
