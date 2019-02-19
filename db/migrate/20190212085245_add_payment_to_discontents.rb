class AddPaymentToDiscontents < ActiveRecord::Migration[5.0]
  def change
    add_column :discontents, :payment, :integer, default: 0, null: false
  end
end
