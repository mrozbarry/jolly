class GmodServerStatus < ActiveRecord::Base
  belongs_to :gmod_server

  def players
    out = JSON.parse player_hash
    puts out.inspect
    out
  end
end
