 class CreateCategories < ActiveRecord::Migration
  def change
  	#drop_table :categories
    create_table :categories do |t|
      t.string :Name

      t.timestamps
    end
  end
end
