class AcademicCalendar < ApplicationRecord
  validates :no_lecture_date, presence: true
end
