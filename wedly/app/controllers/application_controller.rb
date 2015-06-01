class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def application
    @current_user = User.find(params[:id])
    u = @current_user
    u.photos.thumb.current_path
    u.save!
  end

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

