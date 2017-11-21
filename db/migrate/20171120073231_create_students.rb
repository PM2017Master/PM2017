class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students,id: :uuid do |t|
      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
