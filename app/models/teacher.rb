class Teacher < ApplicationRecord
    has_many :lectures, through: :teacher_lectures
    has_many :teacher_lectures

    has_many :cancel_lectures, through: :teacher_lectures
    has_many :supplement_lectures, through: :teacher_lectures
    has_many :reports, through: :teacher_lectures
end
