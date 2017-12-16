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

    not_exist_lectures = []
    
    for period in 1..50  do    
      xlsx.sheet(0).row(period).each do |culum|
        unless culum.nil?
            if culum.index('(')
              num = culum.index('(')
              culum.slice!(num,culum.length)
            end
        end

        if Lecture.exists?(:name => culum)
          l_id = Lecture.find_by(:name => culum).id
          obj = new
          obj.student_id = s_id
          obj.lecture_id = l_id
          obj.save
        else
          not_exist_lectures.push(culum)
        end
      end

    end

    return not_exist_lectures.uniq
  end
end
