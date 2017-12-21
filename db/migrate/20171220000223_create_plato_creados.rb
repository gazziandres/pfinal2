class CreatePlatoCreados < ActiveRecord::Migration[5.1]
  def change
    create_table :plato_creados do |t|
      t.references :ingrediente, foreign_key: true
      t.references :plato, foreign_key: true

      t.timestamps
    end
  end
end
