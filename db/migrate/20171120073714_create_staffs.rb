class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :email, null: false

      t.timestamps

      t.index [:email], unique: true
    end
  end
end
