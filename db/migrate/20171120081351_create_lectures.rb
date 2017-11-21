class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :syllabus_code, null: false, unique: true
      t.string :name, null: false
      t.string :semester, null: false
      t.string :year, null: false
      t.boolean :is_intensive, default: false
      t.string :day
      t.integer :period

      t.timestamps
    end
  end
end
