class CreateCratItems < ActiveRecord::Migration[5.2]
  def change
    create_table :crat_items do |t|
    	t.integer :end_user_id
    	t.integer :item_id
    	t.integer :quantity

      t.timestamps
    end
  end
end
