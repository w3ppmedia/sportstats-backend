class Region < ApplicationRecord
  validates_uniqueness_of :crowdscore_dbid
end
