class CancelLecture < ApplicationRecord
  belongs_to :teacher_lecture

  has_many :teachers, through: :teacher_lectures
  has_many :lectures, through: :teacher_lectures
end
