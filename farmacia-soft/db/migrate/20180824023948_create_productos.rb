class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|

      t.timestamps
    end
  end
end
