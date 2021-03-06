class GmodServer < ActiveRecord::Base
  has_many :gmod_server_statuses

  def last_online
    last = GmodServerStatus.where(gmod_server_id: self.id, reachable: true).last
    return last[:created_at].to_s unless last.nil?
    return "forever"
  end

  def last_checked
    self.gmod_server_statuses.last[:created_at]
  end

  def steam_url
    "steam://connect/#{self.ip}:#{self.port}"
  end

  def last_24_hour_statuses
    statuses = gmod_server_statuses.order("id DESC")
    c = 12
    result = (0...24).map do |i|
      statuses[i * 5] || GmodServerStatus.new( :reachable => false, :player_count => 0, :player_hash => "", :ping => 0 )
    end

    return result.reverse
  end

  def last_24_hour_playercounts
    counts = []
    last_24_hour_statuses.each do |stat|
      counts << stat[:player_count]
    end
    counts
  end

  def last_24_hour_pings
    pings = []
    last_24_hour_statuses.each do |stat|
      pings << stat[:ping]
    end
    pings
  end
end
