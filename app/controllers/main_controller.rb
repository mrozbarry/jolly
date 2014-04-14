class MainController < ApplicationController
  def index

    @servers = GmodServer.all
    @images = Dir.glob("app/assets/images/screenshots/*.jpg")

  end

  def motd
  end

  def contact
  end
end
