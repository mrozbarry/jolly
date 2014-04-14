require "steam-condenser"

namespace :jolly do
  desc "Jolly and Friends Specific Tasks"
  
  task update_server_list: :environment do
    database = Multidb.use(:data)
    result = true
    database.execute("SELECT * FROM servers;").each do |server|
      Multidb.use(:default)
      hits = GmodServer.find_by_id( server[0] )
      gmodserver = nil
      if hits.nil?
        gmodserver = GmodServer.new :ip => server[1], :port => server[2], :name => server[3], :id => server[0]
      else
        gmodserver = hits.first
        gmodserver.update_attributes :ip => server[1], :port => server[2], :name => server[3]
      end
      result &= gmodserver.save
      #Multidb.use(:data)
    end
    result
  end

  task update_server_status: :environment do
    result = true
    GmodServer.all.each do |server|
      begin
        instance = SourceServer.new server[:ip], server[:port]
        players = instance.players
        status = GmodServerStatus.create! :gmod_server_id => server[:id], :reachable => true, :player_count => players.count, :player_hash => players.to_json.to_s
        puts server[:name] + " updated successfully"
        result &= true
      rescue Exception => e
        status = GmodServerStatus.create! :gmod_server_id => server[:id], :reachable => false, :player_count => 0
        puts server[:name] + " NOT updated successfully"
        puts e.inspect
        result &= false
      end
      result
    end
  end

end
