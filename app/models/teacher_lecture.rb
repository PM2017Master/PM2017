class TeacherLecture < ApplicationRecord
  belongs_to :teacher
  belongs_to :lecture
  
  has_many :cancel_lectures
  has_many :supplement_lectures
  has_many :reports
end
