class GmodServersController < ApplicationController
  def index
    @servers = GmodServer.all
  end

  def show
    @server = GmodServer.find_by_id( params[:id] )
    @statistics = @server.gmod_server_statuses.last
  end

  def join
    if params[:id].nil?
      redirect_to last_url
      return
    end

    # Probably wouldn't hurt to track if the person is logged in
    # Not sure if it would be a relevant statistic, though.

    @server = GmodServer.find_by_id( params[:id] )
    remove_last_page
    redirect_to @server.steam_url
  end
end
