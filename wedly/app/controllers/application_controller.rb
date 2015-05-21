class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def ensure_logged_in
    unless current_user
      flash[:alert]  = "Please log in to proceed."
      redirect_to new_sessions_path
    end
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please log in to proceed."
  end
end

