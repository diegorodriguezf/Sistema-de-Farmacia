class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, :limit => 25, null: false
      t.string :last_name, :limit => 25, null: false
      t.string :username, :null => false
      t.string :crypted_password
      t.string :salt
      t.timestamps                :null => false
    end

    add_index :users, :username, unique: true
  end
end
