class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :empleado_id,null: false
      t.string :username, :null => false
      t.string :crypted_password
      t.string :salt
      t.timestamps :null => false
    end

    add_index :users, :username, unique: true
  end
end
