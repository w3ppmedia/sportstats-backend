class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.integer :capacity
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :crowdscore_dbid

      t.timestamps
    end
  end
end
