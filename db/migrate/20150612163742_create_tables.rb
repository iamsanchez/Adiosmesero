class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.boolean :used

      t.timestamps
    end

    create_table :bills_tables, id: false do |t|
    	t.belongs_to :bill
    	t.belongs_to :order
    end

  end
end
