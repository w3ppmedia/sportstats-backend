class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.string :name
      t.integer :season
      t.integer :competition
      t.integer :active
      t.string :full_name
      t.integer :crowdscore_dbid
      t.timestamps
    end

    add_index(:rounds, :crowdscore_dbid, unique: true)
  end
end
