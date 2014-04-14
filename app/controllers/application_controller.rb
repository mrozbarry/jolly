class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_login
  before_action :add_page_history

  def check_login
    @user = nil
  end

  def add_page_history
    session[:page_history] = [] if session[:page_history].nil?
    session[:page_history] << request.original_url
    session[:page_history].shift if session[:page_history].count > 3
  end

  def remove_last_page
    session[:page_history].pop if !session[:page_history].nil? && session[:page_history].count
  end

end
