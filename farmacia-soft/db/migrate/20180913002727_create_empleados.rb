class CreateEmpleados < ActiveRecord::Migration[5.1]
  def change
    create_table :empleados do |t|
      t.string :nombre, :limit => 25, null: false
      t.string :apellido, :limit => 25, null: false
      t.date :fecha_ingreso, null: false
      t.date :fecha_salida, null: true
      t.string :nro_documento,:limit => 15,:null => false
      t.date   :fecha_nacimiento,:null => false
      t.string :nacionalidad,:limit => 50,:null => true
      t.string :direccion,:limit => 200,:null => true
      t.string :telefono,:limit => 20,:null => true
      t.string :sexo,:limit => 1,:null => false
      t.boolean :activo,default: false
      t.timestamps
    end
      add_index :empleados,:nro_documento, unique: true
  end
  def self.down
     drop_table :empleados
  end

end
