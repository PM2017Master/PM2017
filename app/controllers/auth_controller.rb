class AuthController < ApplicationController
include AuthHelper

    def gettoken
     token = view_context.get_token_from_code(params[:code])
     @email = view_context.get_user_email(token.token)

     logger.debug token.inspect
     session[:user_email] = get_user_email token.token

     str = @email
     check = str.include?("student")


     if Staff.exists?(email: @email) then
          #session[:staff_login_flag] = true
         redirect_to controller: 'staff_homes', action: 'index'
        elsif Teacher.exists?(email:@email) then
                #session[:teacher_login_flag] = true
                redirect_to controller: 'teacher_homes', action: 'index'
            elsif check
                if Student.exists?(email: @email) #存在する
                    #tokenを更新
                    student = Student.find_by(email: @email)
                    student.azure_token = token.to_hash
                    student.save
                elsif
                    #新規作成
                    Student.create(email: @email, azure_token: token.to_hash)
                end
                #session[:student_login_flag] = true
                redirect_to  controller: 'student_homes', action: 'index'
            else
                redirect_to controller: 'auth', action: 'login_error'

            end


    end


    def logout
       # if session[:stff_login_flag]== nil && session[:teacher_login_flag]== nil && session[:student_login_flag] == nil
        #    redirect_to root_path,:notice => 'ログインしていません。'

        if session[:user_email] == nil
            redirect_to root_path,:notice => 'ログインしていません。'
        else
            session[:user_email] = nil
            cookies[:_p_mapp_session] = nil
            redirect_to root_path,:notice => '正常にログアウトできました。'

        end

    end

end
