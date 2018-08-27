class CreateTipoUsosMedicamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_usos_medicamentos do |t|
      t.integer :medicamento_id,  :null => false
      t.integer :tipo_medicamento_uso_id,  :null => false
      t.timestamps
    end
  end
end
