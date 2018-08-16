class Clientes < ActiveRecord::Migration[5.1]
  def change
  	 create_table :clientes do |t|
      t.string :nombre, :limit => 25, null: false
      t.string :apellido, :limit => 25, null: false
  	  t.string :nro_documento,:limit => 15,:null => false
  	  t.date   :nacimiento,:null => false
  	  t.string :nacionalidad,:limit => 50,:null => true
  	  t.string :direccion,:limit => 200,:null => true
  	  t.string :telefono,:limit => 20,:null => true
  	  t.string :sexo,:limit => 1,:null => false
      t.timestamps
    end
   end 
    def self.down
       drop_table :clientes
    end
end
