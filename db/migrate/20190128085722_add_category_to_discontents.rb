class AddCategoryToDiscontents < ActiveRecord::Migration[5.0]
  def change
    add_reference :discontents, :category, foreign_key: true
  end
end
