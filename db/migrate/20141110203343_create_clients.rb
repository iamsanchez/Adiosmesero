class CreateClients < ActiveRecord::Migration
  def change
      create_table :clients do |t|
      t.belongs_to :bill
      t.string :Name
      t.float :ISV
      t.float :Total
      
      t.timestamps
    end
  end
end
