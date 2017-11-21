class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :email, null: false, unique: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
