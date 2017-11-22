class Lecture < ApplicationRecord
    has_many :students, throught: :student_lectures
    has_many :student_lectures

    has_many :teachers, throught: :teacher_lectures
    has_many :teacher_lectures

    has_many :cancel_lectures, throught: :teacher_lectures
    has_many :supplement_lectures, throught: :teacher_lectures
    has_many :reports, throught: :teacher_lectures
end
