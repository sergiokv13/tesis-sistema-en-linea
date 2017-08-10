class CreateOpcions < ActiveRecord::Migration[5.1]
  def change
    create_table :opcions do |t|
      t.text :informacion
      t.references :partido, foreign_key: true
      t.string :nombre
      t.timestamps
    end
  end
end
