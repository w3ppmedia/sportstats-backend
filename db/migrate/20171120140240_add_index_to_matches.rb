class AddIndexToMatches < ActiveRecord::Migration[5.0]
  def up
    add_foreign_key(:matches, :teams, column: :home_team_id, primary_key: :id)
    add_foreign_key(:matches, :teams, column: :away_team_id, primary_key: :id)
    add_foreign_key(:matches, :seasons, column: :season_id, primary_key: :id)
    add_foreign_key(:matches, :competitions, column: :competition_id, primary_key: :id)
  end

  def down
    remove_foreign_key(:matches, :teams)
    remove_foreign_key(:matches, :seasons)
    remove_foreign_key(:matches, :competition)
  end
end
