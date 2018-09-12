class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :medicamento_id,:null => false
      t.integer :cantidad, :null=>false,default: 0
      t.timestamps
    end
  end
  def self.down
       drop_table :stocks
  end
end
