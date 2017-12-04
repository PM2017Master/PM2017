class StudentLecture < ApplicationRecord
  belongs_to :student
  belongs_to :lecture

  require 'roo'

  def self.registe_lecture_data(s_id,file_path)
    logger.debug file_path
    student =  Student.find(s_id)
    xlsx = Roo::Excelx.new(file_path)

    logger.debug 'ok!'
    logger.debug xlsx.sheet(0).row(4)

    #rowの番号は調整してください！
    xlsx.sheet(0).row(4).each do |culum|
      unless culum.nil?
          num = culum.index('(')
          culum.slice!(num,culum.length)
      end
      if Lecture.exists?(:name => culum)
        l_id = Lecture.find_by(:name => culum).id
        obj = new
        obj.student_id = s_id
        obj.lecture_id = l_id
        obj.save
      end
    end


  end

end
