class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_goals
      t.integer :away_goals
      t.integer :extra_time
      t.integer :season_id
      t.integer :venue_id
      t.integer :competition_id
      t.integer :result
      t.integer :round_id
      t.integer :match_start
      t.integer :crowdscore_dbid
      t.timestamps
    end
  end
end
