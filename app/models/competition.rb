class Competition < ApplicationRecord
  validates_uniqueness_of :crowdscore_dbid
end
