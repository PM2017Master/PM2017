class AddDateNameToAcademicCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :academic_calendars, :date_name, :string
  end
end
