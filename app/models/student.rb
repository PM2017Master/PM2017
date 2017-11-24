class Student < ApplicationRecord
    has_many :student_lectures
    has_many :lectures, through: :student_lectures
end
