class WelcomController < ApplicationController
  include AuthHelper
  def home
    @login_url = get_login_url
    end
end
