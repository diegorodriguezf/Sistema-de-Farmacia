class CreateMarcas < ActiveRecord::Migration[5.1]
  def change
    create_table :marcas do |t|
       t.string :marca, limit: 25, :null => false
      t.timestamps
    end
  end
  def self.down
       drop_table :marcas
  end
end
