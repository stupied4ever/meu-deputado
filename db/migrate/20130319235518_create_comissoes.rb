class CreateComissoes < ActiveRecord::Migration
  def change
    create_table :comissoes do |t|
      t.text :nome
      t.string :sigla

      t.timestamps
    end
  end
end
