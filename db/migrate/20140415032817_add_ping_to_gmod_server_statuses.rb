class AddPingToGmodServerStatuses < ActiveRecord::Migration
  def change
    add_column :gmod_server_statuses, :ping, :integer
  end
end
