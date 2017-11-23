class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :national
      t.string :short_name
      t.string :shirt_url
      t.timestamps
    end
  end
end
