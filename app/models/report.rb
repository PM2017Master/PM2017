class Report < ApplicationRecord
  belongs_to :teacher_lecture

  has_one :teacher, through: :teacher_lecture
  has_one :lecture, through: :teacher_lecture
end
