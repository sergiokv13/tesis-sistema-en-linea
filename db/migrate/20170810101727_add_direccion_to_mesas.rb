class AddDireccionToMesas < ActiveRecord::Migration[5.1]
  def change
    add_column :mesas, :direccion, :string
  end
end
