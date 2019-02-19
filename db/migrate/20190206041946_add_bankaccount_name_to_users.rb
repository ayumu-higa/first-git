class AddBankaccountNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bankaccount_name, :string
  end
end
