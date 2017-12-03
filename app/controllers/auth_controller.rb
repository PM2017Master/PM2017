class AuthController < ApplicationController
include AuthHelper

    def gettoken
     token = view_context.get_token_from_code(params[:code])
     @email = view_context.get_user_email(token.token)


     str = @email
     check = str.include?("student")


     if Staff.where(email: @email).count == 1 then
         redirect_to controller: 'staff_homes', action: 'index'
        elsif Teacher.where(email:@email).count == 1 then
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
                redirect_to  controller: 'student_homes', action: 'index'
            else
                redirect_to controller: 'welcom', action: 'home'

            end


    end

    # 燃費くん改修よろしく！終わったらこのメッセージ消してね！
    #　:hogehogeに適切な変数突っ込むとセッションとcokkieに入ってるデータが破壊されるはず！(どこでsessionにデータ突っ込んでるのかとかは分からんかったからここはよろしく！)
    def logout
        session[:hogehoge] = nil
        cookies.delete(:hogehoge)
        redirect_to root_path,:notice => '正常にログアウトできました。'
    end

end
