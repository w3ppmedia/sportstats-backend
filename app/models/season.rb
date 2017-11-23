class Season < ApplicationRecord
  validates_uniqueness_of :crowdscore_dbid
end
