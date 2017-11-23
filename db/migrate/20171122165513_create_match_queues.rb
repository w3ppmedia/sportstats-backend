class CreateMatchQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :match_queues do |t|
      t.integer :round_id
      t.integer :processed
      t.timestamps
    end
  end
end
