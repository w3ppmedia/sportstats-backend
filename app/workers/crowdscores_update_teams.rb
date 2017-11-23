class CrowdscoresUpdateTeams
  @queue = 'crowdscores_update_teams'

  def self.perform()
    request = Typhoeus::Request.new(
      "api.crowdscores.com/v1/teams",
      method: :get,
      headers: { 'x-crowdscores-api-key' => 'efa501a0aa81457db48470c68158e3d0'}
    )

    response = request.run
    process_teams(response.response_body) if response.response_code == 200
  end

  def self.process_teams(json_data)
    teams = JSON.parse(json_data, object_class: OpenStruct)

    teams.each do |team|
      Team.new(
        name: team.name,
        national: team.isNational,
        short_name: team.shortName,
        short_code: team.shortCode,
        shirt_url: team.shirtUrl,
        crowdscore_dbid: team.dbid
      ).save
    end
  end
end
