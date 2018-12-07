class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user, :logged_in?

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
  	current_user != nil
  end

  def authorize
  	redirect_to '/login' unless current_user
  end
end
