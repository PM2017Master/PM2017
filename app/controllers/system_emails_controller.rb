#　atsushi's place

class SystemEmailsController < SystemBaseController
    def sendmail_lecture
        event = "休講"
        lecture = "プロジェクトマネジメント論"
        date = "2017年11月28日"
        period = "2限"

        @mail = SendEmailMailer.lecture_date(event,lecture,date,period,"pmstudent2017@outlook.com").deliver_now
        render plain: "メール送信済み。"
    end
    
    def sendmail_report
        reportname = "第１回レポート"
        lecture = "画像処理"
        date = "2017年11月28日"
        content = "難しいよ！！"
        @mail = SendEmailMailer.report(reportname,lecture,date,content,"pmstudent2017@outlook.com").deliver_now
        render plain: "メール送信済み。"
    end
    
end
