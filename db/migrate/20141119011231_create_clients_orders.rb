class CreateClientsOrders < ActiveRecord::Migration
  def change
    create_table :clients_orders, id: false do |t|
    	t.belongs_to :order
    	t.belongs_to :client
    end
#        add_index :clients_orders, [:client_id, :order_id], unique: true, name: "clients_orders"
  end
end
