class CreateMovimientoStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :movimiento_stocks do |t|
      t.integer :empleado_id, null: false
      t.date :fecha, null: false
      t.string :tipo_movimiento, :null=>false,:limit=>10
      t.string :descripcion, :null=>true,:limit=>100
      t.timestamps
    end
  end
  def self.down
       drop_table :movimiento_stocks
  end
end
