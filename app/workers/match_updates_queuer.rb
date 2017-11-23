class MatchUpdatesQueuer
  @queue = 'match_updates_queuer'

  def self.perform
    rounds = MatchQueue.rounds(500)

    rounds.each do |rounds|
      Resque.enqueue(CrowdscoresUpdateMatches, rounds.round_id)
      rounds.update_attributes(processed: 1)
    end
  end
end
