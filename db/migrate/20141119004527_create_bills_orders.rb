class CreateBillsOrders < ActiveRecord::Migration
  def change
    create_table :bills_orders do |t|
    	t.belongs_to :bill
    	t.belongs_to :order
    end
	#    add_index :bills_orders, [:bill_id,:order_id], unique: true, name: "bills_orders"
  end
end
