class Lecture < ApplicationRecord
    require 'csv'

    #リレーション
    has_many :student_lectures, dependent: :destroy
    has_many :students, through: :student_lectures

    has_many :teacher_lectures, dependent: :destroy
    has_many :teachers, through: :teacher_lectures

    has_many :cancel_lectures, through: :teacher_lectures
    has_many :supplement_lectures, through: :teacher_lectures
    has_many :reports, through: :teacher_lectures

    #バリデーション
    validates :year, numericality: true, length: { is: 4 } #数字4文字のみ
    validates :day, inclusion: { in: ['月', '火', '水', '木', '金',nil] }, length: { maximum: 1 } #曜日バリデーション
    validates :period, length: { maximum: 1 } #数字一文字
    validates :is_intensive, inclusion: { in: [true, false,TRUE,FALSE,nil] } #bool値のみ
    validates :semester, inclusion: { in: %w(前期 後期) }, length: { is: 2 } #学期バリデーション

    def self.import(file)
      if File.extname(file.original_filename) == '.csv'
      #　すでにデータが存在する場合は全て削除して更新
      begin
      ActiveRecord::Base.transaction do
      present_lecture = all
      delete_all_lectures(present_lecture) if present_lecture.count > 0
      CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
        obj = new
        obj.attributes = row.to_hash.slice(*updatable_attributes)
        obj.save!
      end
      end
      logger.debug 'ファイルのアップロードに成功しました。'
      #end of transaction
      rescue ActiveRecord::RecordInvalid
        logger.debug 'トランザクションエラーです。'
        redirect_to new_staff_operate_lecture_path
      end
      else
        logger.debug '不正なファイルです。'
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

  private
  def self.delete_all_lectures(lectures)
    lectures.each do |lecture|
      lecture.delete
    end
  end

end
