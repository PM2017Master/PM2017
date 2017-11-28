class Lecture < ApplicationRecord
    has_many :student_lectures, dependent: :destroy
    has_many :students, through: :student_lectures

    has_many :teacher_lectures, dependent: :destroy
    has_many :teachers, through: :teacher_lectures

    has_many :cancel_lectures, through: :teacher_lectures
    has_many :supplement_lectures, through: :teacher_lectures
    has_many :reports, through: :teacher_lectures

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|

        obj = new
        obj.attributes = row.to_hash.slice(*updatable_attributes)

        obj.save!
      end
    end

    def self.updatable_attributes
      ["syllabus_code","name","semester","year","is_intensive","day","period","faculty","department"] #登録可能なデータをバリデーション
    end

    def self.search params
      if params[:search].present? or params[:faculty].present?
        where("name like ? or faculty = ? or department = ?","%#{params[:search]}%",params[:faculty],params[:department])
      else
        Lecture.all
    end
  end
end
