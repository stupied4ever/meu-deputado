class DeputadoComissao < ActiveRecord::Base
	attr_accessible :cadeira, :comissao_id, :deputado_id, :comissao

	belongs_to :deputado
	belongs_to :comissao
	validates_presence_of :cadeira, :comissao, :deputado
	validates :cadeira, :uniqueness => { :scope => [:comissao_id, :deputado_id] } 

	validates_inclusion_of :cadeira, :in => %w( titular suplente )
end
