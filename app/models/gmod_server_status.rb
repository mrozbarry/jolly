class GmodServerStatus < ActiveRecord::Base
  belongs_to :gmod_server

  def players
    JSON.parse player_hash
  end
end
