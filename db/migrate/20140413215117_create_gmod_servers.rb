class CreateGmodServers < ActiveRecord::Migration
  def change
    create_table :gmod_servers do |t|
      t.string :ip
      t.integer :port
      t.string :name

      t.timestamps
    end
  end
end
