class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps

      t.index [:email], unique: true
    end
  end
end
