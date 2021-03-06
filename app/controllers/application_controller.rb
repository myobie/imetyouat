class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::UnknownFormat, with: :render_main_html

  private

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  def current_user
    if defined?(@current_user)
      @current_user
    else
      @current_user = if cookies[:user_id].present? && cookies[:remember_me].present?
                        User.where(id: cookies[:user_id], remember_me_token: cookies[:remember_me]).first
                      end
    end
  end
  helper_method :current_user

  def render_main_html
    if request.format == :html
      render "homepage/index", format: :html
    else
      raise ActionController::UnknownFormat
    end
  end
end
