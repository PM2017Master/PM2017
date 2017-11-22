class CreateStudentLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :student_lectures do |t|
      t.references :student, index: true, foreign_key: true
      t.references :lecture, index: true, foreign_key: true

      t.timestamps
    end
  end
end
