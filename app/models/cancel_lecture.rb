class CancelLecture < ApplicationRecord
  belongs_to :teacher_lecture

  has_many :teachers, throught: :teacher_lectures
<<<<<<< HEAD
  has_many :lectures, throught: :teacher_lectures
=======
  has_many :lectures , throught: :teacher_lectures
>>>>>>> 4efa4b06f3c2e8f826786e091c4a1bbb54499f1a
end
