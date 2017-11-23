class Match < ApplicationRecord
  validates_uniqueness_of :crowdscore_dbid

  belongs_to :season
  belongs_to :venue
  belongs_to :competition
  belongs_to :round
  belongs_to :home_team, class_name: 'Team', foreign_key: :home_team_id, optional: true
  belongs_to :away_team, class_name: 'Team', foreign_key: :away_team_id, optional: true

  def deep_inspect
    ([inspect] + self.class.reflect_on_all_associations.map { |a|
      p a.inspect
    }).compact.join("\n  ")
  end
end
