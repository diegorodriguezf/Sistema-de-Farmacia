class CreateUsoProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :uso_productos do |t|
       t.string :descripcion, limit: 60, :null => false
      t.timestamps
    end
  end
  def self.down
       drop_table :uso_productos
  end
end
