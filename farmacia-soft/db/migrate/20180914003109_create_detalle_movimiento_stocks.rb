class CreateDetalleMovimientoStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :detalle_movimiento_stocks do |t|
      t.integer :movimiento_stock_id,:null => false
      t.integer :medicamento_id, :null=>false
      t.integer :cantidad,:null=> false
      t.timestamps
    end
  end
  def self.down
     drop_table :detalle_movimiento_stocks
  end
end
