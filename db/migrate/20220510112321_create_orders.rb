class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
     t.refenences :user
     t.refenences :item
      t.timestamps
    end
  end
end
