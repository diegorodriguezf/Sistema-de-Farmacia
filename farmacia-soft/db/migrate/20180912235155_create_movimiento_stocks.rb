class CreateMovimientoStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :movimiento_stocks do |t|

      t.timestamps
    end
  end
end
