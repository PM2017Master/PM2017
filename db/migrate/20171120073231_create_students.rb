class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :email, null: false

      t.timestamps

      t.index [:email], unique: true
    end
  end
end
