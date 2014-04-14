class MainController < ApplicationController
  def index

    @servers = GmodServer.all

  end

  def motd
  end

  def contact
  end
end
