class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
     t.refenences :user ,null: false, foregin_key: true
     t.refenences :item ,null: false, foregin_key: true
      t.timestamps
    end
  end
end
