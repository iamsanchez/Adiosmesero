class CreateProducts < ActiveRecord::Migration
  def change
    
    create_table :products do |t|
      t.string :Name
      t.text :Description
      t.string :Image
      t.float :Tax
      t.float :Price
      t.references :Category, index: true

      t.timestamps
    end
  end
end
