class CreateDeputados < ActiveRecord::Migration
  def change
    create_table :deputados do |t|
      t.integer :ide_cadastro
      t.integer :matricula
      t.integer :id_parlamentar
      t.string :nome
      t.string :nome_parlamentar
      t.string :sexo
      t.string :uf
      t.string :partido
      t.string :gabinete
      t.string :anexo
      t.string :fone
      t.string :email

      t.timestamps
    end
  end
end
