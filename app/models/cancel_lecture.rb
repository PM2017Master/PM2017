class CancelLecture < ApplicationRecord
  belongs_to :teacher_lecture

  has_one :teacher, through: :teacher_lecture
  has_one :lecture, through: :teacher_lecture

  validates :teacher_lecture_id, presence: true
  validates :cancel_date, presence: true
  validates :period, presence: true
end
