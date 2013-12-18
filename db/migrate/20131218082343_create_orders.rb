class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :code
      t.integer :mb_id
      t.integer :pd_id
      t.integer :order_status
      t.float :price
      t.integer :pay_type
      t.integer :pay_status
      t.integer :service_status
      t.text :description

      t.timestamps
    end
  end
end
