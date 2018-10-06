class CreateIvas < ActiveRecord::Migration[5.1]
  def change
    create_table :ivas do |t|
      t.string :descripcion, :limit => 7, null: false
      t.decimal :valor,precision: 3, scale: 2,:null => false,default: 0
      t.timestamps
    end
  end
  def self.down
     drop_table :ivas
  end
end
