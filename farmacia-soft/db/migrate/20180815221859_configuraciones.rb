class Configuraciones < ActiveRecord::Migration[5.1]
  def change
    create_table :configuraciones do |t|
      t.string :nombre_empresa, limit: 50, :null => false
      t.string :nombre_fantasia,:null => true,  :limit => 50
      t.string :logo_path,:null => true,  :limit => 100
      t.string :ruc, limit:11, :null => true
      t.string :direccion, limit: 100, :null => true
      t.string :telefono, :null => true, limit:20 
      t.integer :timbrado_id,  :null => false
      t.timestamps
    end
  end
end
