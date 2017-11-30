class AddTeacherNameToLecture < ActiveRecord::Migration[5.1]
  def change
    add_column :lectures, :teacher_name, :string
  end
end
