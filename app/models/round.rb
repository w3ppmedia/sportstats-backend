class Round < ApplicationRecord
  belongs_to :season
  belongs_to :competition
  validates_uniqueness_of :crowdscore_dbid
end
