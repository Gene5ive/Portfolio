class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, except: [:index, :show]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper :all # include all helpers, all the time
  include ActionView::Helpers::NumberHelper

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
