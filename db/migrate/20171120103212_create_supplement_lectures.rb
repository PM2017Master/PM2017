class CreateSupplementLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :supplement_lectures do |t|
      t.references :TeacherLecture, foreign_key: true
      t.date :supplement_date, null: false
      t.string :period, null: false

      t.timestamps
    end
  end
end
