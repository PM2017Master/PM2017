module SystemEmailsHelper
  def sendmail_lecture(event,lecture,date,period)
    SendemailJob.perform_later(event,lecture,date,period)
      #students = Lecture.find_by(name: lecture).students
      #Parallel.each(students, in_process: 4) do |s|
      #students.each do |s|
      #    SendEmailMailer.lecture_date(event,lecture,date,period,s.email).deliver_now
      #end
      #render plain: "メール送信済み。"

  end

  def sendmail_report (reportname,lecture,date,content)
    SendemailReportJob.perform_later(reportname,lecture,date,content)
      #students = Lecture.find_by(name: lecture).students
      #Parallel.each(students, in_process: 4) do |s|
      #students.each do |s|
      #    SendEmailMailer.report(reportname,lecture,date,content,s.email).deliver_now
      #end
      #render plain: "メール送信済み。"
  end
end
