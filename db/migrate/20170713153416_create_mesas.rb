class CreateMesas < ActiveRecord::Migration[5.1]
  def change
    create_table :mesas do |t|
      t.references :recinto, foreign_key: true
      t.string :nombre_encargado
      t.string :estado
      t.references :encargado, foreign_key: { to_table: :usuarios }
      t.timestamps
    end
  end
end
