class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
