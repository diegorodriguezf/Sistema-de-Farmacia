class CreateFacturaVentas < ActiveRecord::Migration[5.1]
  def change
    create_table :factura_ventas do |t|
      t.timestamps
    end
  end
end
