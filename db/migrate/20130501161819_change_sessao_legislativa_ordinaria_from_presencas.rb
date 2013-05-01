class ChangeSessaoLegislativaOrdinariaFromPresencas < ActiveRecord::Migration
	def up
		remove_column :presencas, :sessao_legislativa_ordinaria
		remove_column :presencas, :sessao_ordinaria

		add_column :presencas, :sessao_legislativa_ordinaria, :string
		add_column :presencas, :sessao_ordinaria, :string
	end

	def down
		remove_column :presencas, :sessao_legislativa_ordinaria
		remove_column :presencas, :sessao_ordinaria

		add_column :presencas, :sessao_legislativa_ordinaria, :boolean
		add_column :presencas, :sessao_ordinaria, :boolean
	end
end
