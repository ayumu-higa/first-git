class AddNaiyouToDiscontents < ActiveRecord::Migration[5.0]
  def change
    add_column :discontents, :naiyou, :integer, default: 0, null: false
  end
end
