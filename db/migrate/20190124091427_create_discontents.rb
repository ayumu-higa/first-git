class CreateDiscontents < ActiveRecord::Migration[5.0]
  def change
    create_table :discontents do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
