class CreateIngredientes < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredientes do |t|
      t.integer :id_tipo
      t.string :nombre
      t.string :foto
      t.integer :precio
      t.integer :grasa
      t.integer :grasa_saturada
      t.integer :grasa_trans
      t.integer :colesterol
      t.integer :sodio
      t.integer :carbohidrato
      t.integer :fibra_dietetica
      t.integer :azucar
      t.integer :proteina

      t.timestamps
    end
  end
end
