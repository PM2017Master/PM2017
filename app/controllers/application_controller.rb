class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_login?, if: :needs_check?

  def check_login?
    logger.debug 'check'
    logger.debug session[:user_email]
    if session[:user_email].nil?
      redirect_to root_path
    end
  end

  def needs_check?
    if controller_name == 'welcom' || controller_name == 'admin_homes' ||controller_name == 'auth' ||controller_name == 'sessions'
      false
    else
      true
    end
  end
end
