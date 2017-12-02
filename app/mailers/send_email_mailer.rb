class SendEmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_email_mailer.lecture_date.subject
  #
  def lecture_date
    @greeting = "Hi"
    
    mail to: "pmstudent2017@outlook.com"
  end

  def lecture_date(event,lecture,date,period,mailadd)
    @event = event
    @lecture = lecture
    @date = date
    @period = period
    mail to: mailadd,
      subject: lecture+'の'+event+'のお知らせ'
  end

  def report(reportname,lecture,date,content,mailadd)
    @reportname = reportname
    @lecture = lecture
    @date = date
    @content = content
    mail to: mailadd,
      subject: lecture+'の'+reportname+'のお知らせ'
  end
end
