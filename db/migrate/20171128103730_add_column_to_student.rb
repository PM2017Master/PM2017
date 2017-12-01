class AddColumnToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :azure_token, :text
  end
end
