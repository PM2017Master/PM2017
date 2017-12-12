class SendemailJob < ApplicationJob
  queue_as :default

  def perform(event,lecture,date,period)
    students = Lecture.find_by(name: lecture).students
    #Parallel.each(students, in_process: 4) do |s|
    students.each do |s|
        SendEmailMailer.lecture_date(event,lecture,date,period,s.email).deliver_now
    end
  end
end
