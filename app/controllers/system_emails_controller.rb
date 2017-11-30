#　atsushi's place

class SystemEmailsController < SystemBaseController
    def sendmail_lecture
        event = "休講"
        lecture = "プロジェクトマネジメント論"
        date = "2017年11月28日"
        period = "2限"
        students = Lecture.find_by(name: lecture).students
        students.each do |s|
            SendEmailMailer.lecture_date(event,lecture,date,period,s.email).deliver_now
        end
        render plain: "メール送信済み。"
    
    end

    def sendmail_report
        reportname = "第１回レポート"
        lecture = "画像処理"
        date = "2017年11月28日"
        content = "難しいよ！！"
        students = Lecture.find_by(name: lecture).students
        students.each do |s|
            SendEmailMailer.report(reportname,lecture,date,content,s.email).deliver_now
        end
        render plain: "メール送信済み。"
    end
    
end
