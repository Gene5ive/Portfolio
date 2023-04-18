class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  protect_from_forgery with: :null_session

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
