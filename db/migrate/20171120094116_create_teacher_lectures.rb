class CreateTeacherLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_lectures do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :lecture, index: true, foreign_key: true

      t.timestamps
    end
  end
end
