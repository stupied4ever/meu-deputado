class ChangePresenteInPresenca < ActiveRecord::Migration
  def change
    rename_column :presencas, :situacao_presenca, :presente
  end
end
