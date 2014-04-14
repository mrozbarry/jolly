class MainController < ApplicationController
  def index

    @servers = GmodServers.all

  end

  def motd
  end

  def contact
  end
end
