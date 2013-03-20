class CreateComissaos < ActiveRecord::Migration
  def change
    create_table :comissaos do |t|
      t.text :nome
      t.string :sigla

      t.timestamps
    end
  end
end
