class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  helper_method :current_user

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  private

  def require_user
    unless current_user
      redirect_to login_path
      false
    end
  end

  def require_no_user
    if current_user
      redirect_to new_datum_path
      false
    end
  end
end
