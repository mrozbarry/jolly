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
end
