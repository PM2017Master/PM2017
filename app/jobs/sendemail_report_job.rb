class SendemailReportJob < ApplicationJob
  queue_as :default

  def perform(reportname,lecture,date,content)
    students = Lecture.find_by(name: lecture).students
    #Parallel.each(students, in_process: 4) do |s|
    students.each do |s|
        SendEmailMailer.report(reportname,lecture,date,content,s.email).deliver_now
    end
  end
end
