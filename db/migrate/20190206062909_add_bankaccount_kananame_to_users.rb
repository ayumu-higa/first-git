class AddBankaccountKananameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bankaccount_kananame, :string
  end
end
