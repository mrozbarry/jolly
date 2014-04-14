class CreateGmodServerStatuses < ActiveRecord::Migration
  def change
    create_table :gmod_server_statuses do |t|
      t.integer :gmod_server_id
      t.boolean :reachable
      t.integer :player_count
      t.text :player_hash

      t.timestamps
    end
  end
end
