class StudentLecture < ApplicationRecord
  belongs_to :student
  belongs_to :lecture
end
