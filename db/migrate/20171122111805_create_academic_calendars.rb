class CreateAcademicCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_calendars do |t|
      t.date :no_lecture_date, null: false

      t.timestamps
    end
  end
end
