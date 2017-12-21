class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :plato, foreign_key: true
      t.boolean :payed, default: false
      t.integer :price
      t.integer :quantity, default: 0
      t.float :latitude
      t.float :longitude
      t.datetime :checked_out_at

      t.timestamps
    end
  end
end
