class CreatePlatos < ActiveRecord::Migration[5.1]
  def change
    create_table :platos do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
