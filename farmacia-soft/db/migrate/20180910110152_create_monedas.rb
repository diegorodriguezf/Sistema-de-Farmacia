class CreateMonedas < ActiveRecord::Migration[5.1]
  def change
    create_table :monedas do |t|
      t.string :moneda,:null=>false,limit: 25
      t.string :simbolo,:null=>true,limit: 5
      t.integer :decimales, null: false
      t.timestamps
    end
  end
  def self.down
     drop_table :monedas
  end
end
