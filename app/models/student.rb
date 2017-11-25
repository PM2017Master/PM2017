class Student < ApplicationRecord
    has_many :student_lectures, dependent: :destroy
    has_many :lectures, through: :student_lectures
end
