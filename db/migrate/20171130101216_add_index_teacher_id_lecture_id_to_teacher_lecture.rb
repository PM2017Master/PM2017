class AddIndexTeacherIdLectureIdToTeacherLecture < ActiveRecord::Migration[5.1]
  def change
    add_index :teacher_lectures, [:teacher_id, :lecture_id], unique: true
  end
end
