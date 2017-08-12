class CreatePartidos < ActiveRecord::Migration[5.1]
  def change
    create_table :partidos do |t|
      t.string :nombre
      t.text :informacion
      t.references :votacion, foreign_key: true
      t.string :color
      t.string :color_secundario
      t.string :direccion
      t.timestamps
    end
  end
end
