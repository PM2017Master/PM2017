class Lecture < ApplicationRecord
    has_many :student_lectures, dependent: :destroy
    has_many :students, through: :student_lectures

    has_many :teacher_lectures, dependent: :destroy
    has_many :teachers, through: :teacher_lectures

    has_many :cancel_lectures, through: :teacher_lectures
    has_many :supplement_lectures, through: :teacher_lectures
    has_many :reports, through: :teacher_lectures
end
