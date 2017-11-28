class AuthController < ApplicationController
include AuthHelper

    def gettoken
     token = get_token_from_code params[:code]
     @email = get_user_email token.token


     str = @email
     check = str.include?("student")

  
     if Staff.where(email: @email).count == 1 then
         redirect_to controller: 'staff_homes', action: 'index'
        elsif Teacher.where(email:@email).count == 1 then
                redirect_to controller: 'teacher_homes', action: 'index'
            elsif check
                redirect_to  controller: 'student_homes', action: 'index'
            else
                redirect_to controller: 'welcom', action: 'home'

            end


    end

  
end
