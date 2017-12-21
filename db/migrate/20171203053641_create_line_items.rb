class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :plato_id
      t.decimal :price

      t.timestamps
    end
    add_index :line_items, :order_id
    add_index :line_items, :plato_id
  end
end
