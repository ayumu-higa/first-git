class CreateOtoiawases < ActiveRecord::Migration[5.0]
  def change
    create_table :otoiawases do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.boolean :hensin, default: false, null: false

      t.timestamps
    end
  end
end
