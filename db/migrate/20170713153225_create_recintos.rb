class CreateRecintos < ActiveRecord::Migration[5.1]
  def change
    create_table :recintos do |t|
      t.string :nombre
      t.integer :numero_maximo_votantes
      t.references :sector, foreign_key: true
      t.string :nombre_encargado
      t.references :encargado, foreign_key: { to_table: :usuarios }
      t.timestamps
    end
  end
end
