class DeputadoComissao < ActiveRecord::Base
	attr_accessible :cadeira, :comissao_id, :deputado_id, :comissao

	belongs_to :deputado
	belongs_to :comissao
	validates_presence_of :cadeira, :comissao, :deputado
	validates_uniqueness_of :cadeira, :scope => [:comissao_id, :deputado_id]

	validates_inclusion_of :cadeira, :in => %w( titular suplente )
end
