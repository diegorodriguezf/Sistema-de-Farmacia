class CreateMedicamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :medicamentos do |t|
      t.string :nombre, limit: 35, :null => false
      t.string :descripcion,:null => true,  :limit => 60
      t.date :fecha_vencimiento,:null=>false
      t.string :tipo_uso_ids, :null=>false,:limit=>30
      t.integer :present_med_id,:null => false
      t.integer :cant_comprimido,:null=> false
      t.integer :cant_st_min,:null=>false
      t.integer :cant_st_max,:null=>false
      t.integer :precio_compra,:null=>false
      t.integer :precio_venta,:null=>false
      t.string :modo_aplicacion, limit:20, :null => false
      t.string :especificacion, limit:100, :null => true
      t.boolean :activo, :default=> false
      t.timestamps
    end
  end
  def self.down
       drop_table :medicamentos
  end
end
