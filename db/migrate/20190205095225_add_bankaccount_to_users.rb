class AddBankaccountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bankaccount, :string
  end
end
