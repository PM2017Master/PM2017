class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :teacher_lecture, foreign_key: true
      t.string :title
      t.text :content
      t.date :deadline_date, null: false

      t.timestamps
    end
  end
end
