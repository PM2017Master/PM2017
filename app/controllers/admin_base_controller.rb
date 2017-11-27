class AdminBaseController < ApplicationController
  def after_sign_in_path_for(resource)
    admin_homes_path
  end
  
  def rogin
  end
end
