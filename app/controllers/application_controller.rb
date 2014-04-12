class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :select_shard

  # Make sure by default we are using the local connection!
  def select_shard(&block)
    Octopus.user(:site, &block)
  end
end
