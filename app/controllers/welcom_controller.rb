class WelcomController < ApplicationController
  include AuthHelper
  layout 'welcom_base'

  def home
    @login_url = get_login_url
    end
end
