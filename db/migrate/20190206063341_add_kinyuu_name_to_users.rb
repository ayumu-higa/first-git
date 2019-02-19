class AddKinyuuNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :kinyuu_name, :string
  end
end
