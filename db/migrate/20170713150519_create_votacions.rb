class CreateVotacions < ActiveRecord::Migration[5.1]
  def change
    create_table :votacions do |t|
      t.text :razon
      t.datetime :inicio
      t.datetime :finalizacion
      t.integer :numero_maximo_votantes
      t.string :etapa
      t.boolean :informacion_conluida
      t.integer :balotas
      t.string :direccion_principal
      t.timestamps
    end
  end
end
