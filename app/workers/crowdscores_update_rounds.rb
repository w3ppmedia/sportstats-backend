class CrowdscoresUpdateRounds
  @queue = :crowdscores_update_rounds

  def self.perform()
    request = Crowdscore::Request.new
    response = request.process('rounds')

    process(response.response_body) if response.response_code == 200
  end

  def self.process(json_data)
    rounds = JSON.parse(json_data, object_class: OpenStruct)

    rounds.each do |round|
      Round.new(
        name: round.name,
        active: round.active,
        full_name: round.fullName,
        crowdscore_dbid: round.dbid,
        season: Season.find_by(crowdscore_dbid: round.season.dbid),
        competition: Competition.find_by(crowdscore_dbid: round.competition.dbid)
      ).save
    end
  end
end
