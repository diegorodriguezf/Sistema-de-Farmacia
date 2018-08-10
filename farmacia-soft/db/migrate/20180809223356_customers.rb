class Customers < ActiveRecord::Migration[5.1]
  def change
  	 create_table :customers do |t|
      t.string :first_name, :limit => 25, null: false
      t.string :last_name, :limit => 25, null: false
  	  t.string :doc_number,:limit => 15,:null => false
  	  t.date   :birthdate,:null => false
  	  t.string :nationality,:limit => 50,:null => true
  	  t.string :address,:limit => 200,:null => true
  	  t.string :phone,:limit => 20,:null => true
  	  t.string :sexo,:limit => 1,:null => false
      t.timestamps
    end
   end 
    def self.down
       drop_table :customers
    end
end
