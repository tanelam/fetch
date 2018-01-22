class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorized
  include SessionsHelper
  helper_method :logged_in?
end
