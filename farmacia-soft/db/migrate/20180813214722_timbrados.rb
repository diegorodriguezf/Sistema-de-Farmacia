class Timbrados < ActiveRecord::Migration[5.1]
  def change
    create_table :timbrados do |t|
      t.integer :timbrado,  :null => false
      t.string :serie,:null => false,  :limit => 10
      t.integer :nro_desde,  :null => false
      t.integer :nro_hasta,  :null => false
      t.date :fecha_circulacion, :null => false
      t.date :fecha_expiracion, :null => false
      t.boolean :estado,default: false
      t.timestamps
    end
    add_index :timbrados, :timbrado, unique: true
  end
  def self.down
       drop_table :timbrados
  end

end
