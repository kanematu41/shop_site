class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :name
    	t.string :image_id
    	t.text :detail
    	t.integer :non_tax_price
    	t.integer :genre_id
    	t.boolean :is_valid, default: false, null: false

      t.timestamps
    end
  end
end
