class CreateBills < ActiveRecord::Migration
  def change

    create_table :bills do |t|
      t.boolean :paid
      t.timestamps
    end
  end


end

