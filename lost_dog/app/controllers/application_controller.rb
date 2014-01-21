class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead. (:exception was)
  protect_from_forgery with: :exception

  before_action :ensure_user_signed_in
  private
  def ensure_user_signed_in
    unless current_user.present?
      #redirect_to new_sessions_path, flash: 'Must be signed in punk' # Doesn't work
      redirect_to new_sessions_path, flash[:alert] => 'Must be signed in punk'
    end
  end

  def current_user
    if session.has_key? :user_id
      @current_user ||= User.find(session[:user_id])
    end
  end

  helper_method :current_user
end


