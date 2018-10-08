class CreateDetalleFacturaVentas < ActiveRecord::Migration[5.1]
  def change
    create_table :detalle_factura_ventas do |t|
      t.integer :factura_venta_id,:null => false
      t.integer :medicamento_id, :null=>false
      t.integer :cantidad,:null=> false
      t.decimal :exenta,precision: 7, scale: 2,:null => false,default: 0
      t.decimal :iva5,precision: 7, scale: 2,:null => false,default: 0
      t.decimal :iva10,precision: 7, scale: 2,:null => false,default: 0
      t.decimal :subtotal,precision: 7, scale: 2,:null => false,default: 0
      t.timestamps
    end
  end
  def self.down
       drop_table :detalle_factura_ventas
  end
end
