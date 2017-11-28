class AdminBaseController < ApplicationController
  before_action :authenticate_admin!
  def after_sign_in_path_for(resource)
    admin_homes_path
  end
  
  def after_update_path_for 
    admin_homes_path
  end

  def rogin
  end
end
