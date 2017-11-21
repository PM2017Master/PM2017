class Student < ApplicationRecord
    has_many :Lecture,through: :StudentLecture
    has_many :StudentLecture
end
