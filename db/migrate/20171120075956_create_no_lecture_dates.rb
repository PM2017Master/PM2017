class CreateNoLectureDates < ActiveRecord::Migration[5.1]
  def change
    create_table :no_lecture_dates do |t|
      t.date :no_lecture_date, null: false

      t.timestamps
    end
  end
end
