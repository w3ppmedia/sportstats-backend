require 'ostruct'

class CrowdscoresUpdateMatches
  @queue = 'crowdscores_update_matches'

  def self.perform(round)
    request = Crowdscore::Request.new

    response = request.process("matches?round_ids=#{round}")
    process(response.response_body) if response.response_code == 200
  end

  def self.process(json_data)
    matches = JSON.parse(json_data, object_class: OpenStruct)

    matches.each do |match|
      model = Match.new(
        home_team: team(match.homeTeam),
        away_team: team(match.awayTeam),
        home_goals: match.homeGoals,
        away_goals: match.awayGoals,
        extra_time: match.goToExtraTime,
        season: Season.find_by(crowdscore_dbid: match.season.dbid),
        competition: Competition.find_by(crowdscore_dbid: match.competition.dbid),
        result: match.isResult,
        round: Round.find_by(crowdscore_dbid: match.round.dbid),
        match_start: match.start.to_s[0..-6],
        crowdscore_dbid: match.dbid
      )

      unless match.venue.nil?
        model.venue = Venue.where(crowdscore_dbid: match.venue.dbid).first_or_create(
          capacity: match.venue.capacity,
          name: match.venue.name,
          crowdscore_dbid: match.venue.dbid,
          latitude: latitude(match.venue.geolocation),
          longitude: longitude(match.venue.geolocation)
        )
      end

      model.save
    end
  end

  def self.team(team)
    Team.where(crowdscore_dbid: team.dbid).first_or_create(
      name: team.name,
      national: team.isNational,
      short_name: team.shortName,
      short_code: team.short_code,
      shirt_url: team.shirtUrl,
      crowdscore_dbid: team.dbid
    )
  end

  def self.longitude(geolocation)
    return 0.0 if geolocation.nil?
    geolocation.longitude
  end

  def self.latitude(geolocation)
    return 0.0 if geolocation.nil?
    geolocation.latitude
  end
end
