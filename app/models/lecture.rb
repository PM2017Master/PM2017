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

    #登録可能なデータをバリデーション
    def self.updatable_attributes
      ["syllabus_code","name","semester","year","is_intensive","day","period","faculty","department"]
    end

    def self.search params
      if params[:search].present? or params[:faculty].present? or params[:department].present?
        if params[:search].present?
          return where("name like ? and faculty = ? and department = ?","%#{params[:search]}%", params[:faculty], params[:department]) if (params[:faculty].present? && params[:department].present?)
          return where("name like ? and faculty = ?","%#{params[:search]}%", params[:faculty]) if params[:faculty].present?
          return where("name like ? and department = ?","%#{params[:search]}%", params[:department]) if params[:department].present?
          where("name like ? ","%#{params[:search]}%") if ((!params[:department].present?) && (!params[:faculty].present?))
        elsif params[:faculty].present?
          return where("faculty = ? and department = ?",params[:faculty],params[:department]) if params[:department].present?
          where("faculty = ?",params[:faculty]) if (!params[:search].present? && !params[:department].present?)
        elsif params[:department].present?
          where("department = ?",params[:department]) if (!params[:search].present? && !params[:faculty].present?)
        end
      else
        Lecture.all
    end
  end
end
