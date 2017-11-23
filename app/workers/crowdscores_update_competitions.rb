class CrowdscoresUpdateCompetitions
  @queue = :crowdscores_update_competitions

  def self.perform()
    request = Typhoeus::Request.new(
      "api.crowdscores.com/v1/competitions",
      method: :get,
      headers: { 'x-crowdscores-api-key' => 'efa501a0aa81457db48470c68158e3d0'}
    )

    response = request.run
    process_competitions(response.response_body) if response.response_code == 200
  end

  def self.process_competitions(json_data)
    competitions = JSON.parse(json_data, object_class: OpenStruct)

    competitions.each do |competition|
      Competition.new(
        name: competition.name,
        flag_url: competition.flagUrl,
        short_name: competition.shortName,
        full_name: competition.fullName,
        crowdscore_dbid: competition.dbid,
        region_id: process_regions(competition.region)
      ).save
    end
  end

  def self.process_regions(region)
    group_id = save_region_group(region.regionGroup, 1)
    save_region(region, group_id)
  end

  def self.save_region(region_details, group_id)
    region = Region.where(:crowdscore_dbid => region_details.dbid).first_or_create do |region|
      region.name = region_details.name
      region.region_group_id = group_id
      region.crowdscore_dbid = region_details.dbid
      region.flag_url = region_details.flagUrl
    end

    region.id
  end

  def self.save_region_group(region_details, group_id)
    region_group = RegionGroup.where(:crowdscore_dbid => region_details.dbid).first_or_create do |region_group|
      region_group.name = region_details.name
      region_group.region_group_id = group_id
      region_group.crowdscore_dbid = region_details.dbid
      region_group.flag_url = region_details.flagUrl
    end

    region_group.id
  end
end
