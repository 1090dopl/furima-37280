class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,  null: false
      t.integer :price, null: false
      t.text :explanation, null: false
      t.integer :categoly_id, null: false
      t.integer :charge_id, null: false
      t.integer :status_id, null: false
      t.integer :day_id, null: false
      t.integer :prefecture_id, null: false
      t.references :user, null: false, foregin_key: true
      t.timestamps
    end
  end
end
