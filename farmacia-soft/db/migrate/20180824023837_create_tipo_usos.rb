class CreateTipoUsos < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_usos do |t|
      t.string :tipo_uso, limit: 25, :null => false
      t.timestamps
    end
  end
  def self.down
       drop_table :tipo_usos
  end
end
