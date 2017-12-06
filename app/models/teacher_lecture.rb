class TeacherLecture < ApplicationRecord
  belongs_to :teacher
  belongs_to :lecture

  has_many :cancel_lectures, dependent: :destroy
  has_many :supplement_lectures, dependent: :destroy
  has_many :reports, dependent: :destroy
end
