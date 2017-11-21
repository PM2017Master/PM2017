class Teacher < ApplicationRecord
    has_many :lectures, through: :teacher_lectures
    has_many :teacher_lectures
end
