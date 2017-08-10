class AddTerminalHabilitadaToMesas < ActiveRecord::Migration[5.1]
  def change
    add_column :mesas, :terminal_habilitada, :boolean
  end
end
