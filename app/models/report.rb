class Report < ApplicationRecord
  belongs_to :teacher_lecture

  has_one :teacher, through: :teacher_lecture
  has_one :lecture, through: :teacher_lecture

  validates :title, presence: true, length: {maximum: 20}
  validates :content, presence: true, length: {maximum: 200}
  validates :deadline_date, presence: true
end
