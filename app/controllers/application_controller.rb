class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_login?, if: :needs_check?

  def check_login?
    xemail = session[:user_email]
    if xemail.nil?
      redirect_to root_path  
    elsif controller_name.include?('teacher') && !(Teacher.exists?(email: xemail))
      redirect_to root_path
    elsif controller_name.include?('staff') && !(Staff.exists?(email: session[:user_email]))
      redirect_to root_path
    else
      check = xemail.include?("student")
      if controller_name.include?('student') && !(check)
         redirect_to root_path
      end
    end
  end


  def needs_check?
    logger.debug controller_name
    if controller_name.include?('welcom') || controller_name.include?('auth') || controller_name.include?('admin') ||controller_name.include?('sessions') 
      false
    false
    else
      true
    end
  end
end
