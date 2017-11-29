class Lecture < ApplicationRecord
    require 'csv'

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

  # 講義情報ダウンロードボタン押下時に呼び出される
  def self.download
    @lectures = all

    header = ['シラバスコード', '講義名', '学期', '開講年', '集中フラグ', '曜日','時限','学部','学科']
    generated_csv = CSV.generate(row_sep: "\r\n") do |csv|
      csv << header
      @lectures.each do |lecture|
        csv << [lecture.syllabus_code, lecture.name, lecture.semester,
                lecture.year, lecture.is_intensive, lecture.day, lecture.period,
                lecture.faculty, lecture.department]
      end
    end
  end
end
