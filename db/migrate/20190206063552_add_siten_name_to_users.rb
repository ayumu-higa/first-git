class AddSitenNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :siten_name, :string
  end
end
