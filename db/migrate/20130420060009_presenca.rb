class Presenca < ActiveRecord::Migration
  def change
    create_table :presencas do |t|
      t.string  :numero_sessao_legislativa
      t.string  :sessao_legislativa
      t.string  :sessao_numero
      t.boolean :sessao_legislativa_ordinaria
      t.boolean :sessao_ordinaria
      t.string  :sequencial_votacao
      t.string  :nome_parlamentar
      t.boolean :situacao_presenca
      t.string  :partido
      t.string  :uf
      t.string  :codigo_parlamentar
      t.string  :tipo_sessao

      t.timestamps
    end
  end
end
