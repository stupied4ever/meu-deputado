class CreateDeputadoComissoes < ActiveRecord::Migration
  def change
    create_table :deputado_comissoes do |t|
      t.integer :deputado_id
      t.integer :comissao_id
      t.string :cadeira

      t.timestamps
    end
  end
end
