class MainController < ApplicationController
  def index

    @servers = []

    @servers << { :name => "Jolly and Friends Spacebuild #1", :join => "steam://host:port", :status => "online", :players => 5, :collection => "#steam_workshop_collection_url" }
    @servers << { :name => "Jolly and Friends Spacebuild #2", :join => "steam://host:port", :status => "online", :players => 9, :collection => "#steam_workshop_collection_url" }
    @servers << { :name => "Jolly and Friends DarkRP", :join => "steam://host:port", :status => "offline", :players => 0, :collection => "#steam_workshop_collection_url" }

  end

  def motd
  end

  def contact
  end
end
