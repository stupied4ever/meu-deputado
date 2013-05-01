class ChangePresenteFromPresencas < ActiveRecord::Migration
    def up
    remove_column :presencas, :presente
    add_column :presencas, :presente, :string
  end

  def down
    remove_column :presencas, :presente
    add_column :presencas, :presente, :boolean
  end
end
