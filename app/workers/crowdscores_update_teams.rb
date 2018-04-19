class CrowdscoresUpdateTeams
  @queue = 'crowdscores_update_teams'

  def self.perform()
    request = Crowdscore::Request.new

    response = request.process("teams")
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
