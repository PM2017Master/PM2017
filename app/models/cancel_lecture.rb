class CancelLecture < ApplicationRecord
  belongs_to :teacher_lecture

  has_many :teachers, throught: :teacher_lectures
  has_many :lectures, throught: :teacher_lectures
end
