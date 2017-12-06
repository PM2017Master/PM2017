class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_login?, if: :needs_check?

  def check_login?
    if session[:user_email].nil?
      redirect_to root_path
    end
  end

  def needs_check?
    logger.debug controller_name
    unless controller_name.include?('staff') || controller_name.include?('teacher') || controller_name.include?('student')
      false
    else
      true
    end
  end
end
