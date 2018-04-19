class Round < ApplicationRecord
  belongs_to :season, foreign_key: :season
  belongs_to :competition, foreign_key: :competition
  validates_uniqueness_of :crowdscore_dbid
end