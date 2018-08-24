class CreateCategoriaProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria_productos do |t|
      t.string :ctaegoria, limit: 25, :null => false
      t.timestamps
    end
  end
  def self.down
       drop_table :categoria_productos
  end
end
