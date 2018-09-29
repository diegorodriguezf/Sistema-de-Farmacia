class CreateFacturaVentas < ActiveRecord::Migration[5.1]
  def change
    create_table :factura_ventas do |t|
      t.date :fecha,:null=>false
      t.integer :timbrado_id,:null => false
      t.integer :cliente_id,:null => false
      t.integer :empleado_id,:null => false
      t.string :nro_factura, :null=>false,:limit=>15
      t.string :tipo_factura,:null=>false,default: 'Contado',:limit=>10
      t.decimal :total_exentas,precision: 10, scale: 2,:null => false,default: 0
      t.decimal :total_iva5,precision: 10, scale: 2,:null => false,default: 0
      t.decimal :total_iva10,precision: 10, scale: 2,:null => false,default: 0
      t.decimal :total,precision: 10, scale: 2,:null => false,default: 0
      t.boolean :confirmado,default: false
      t.timestamps
    end
  end
  def self.down
       drop_table :factura_ventas
  end
end
