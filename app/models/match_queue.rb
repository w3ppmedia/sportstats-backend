class MatchQueue < ApplicationRecord
  validates_uniqueness_of :round_id

  scope :unprocessed, -> { where(processed: 0) }

  def self.rounds(length = 100)
    rounds = unprocessed

    if rounds.all.count < 1
      self.update_all(processed: 0)
      rounds = unprocessed
    end

    rounds.first(length)
  end
end
