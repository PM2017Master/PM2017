class CreateCancelLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :cancel_lectures,id: :uuid do |t|
      t.references :TeacherLecture, foreign_key: true
      t.date :cancel_date, null: false
      t.string :period, null: false

      t.timestamps
    end
  end
end
