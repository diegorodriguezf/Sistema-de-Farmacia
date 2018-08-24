class CreatePresentacionProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :presentacion_productos do |t|
      t.string :descripcion, limit: 25, :null => false
      t.timestamps
    end
  end
  def self.down
       drop_table :presentacion_productos
  end
end
