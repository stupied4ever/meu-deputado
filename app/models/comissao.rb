class Comissao < ActiveRecord::Base
	attr_accessible :nome, :sigla
	validates_presence_of :nome, :sigla

	has_many :deputados_comissao, 
			 :class_name => "DeputadoComissao", :source => :deputado_comissao
	
	has_many :deputados_titulares_comissao, 
			 :class_name => "DeputadoComissao", :source => :deputado_comissao,
			 :conditions => ['deputado_comissoes.cadeira = ?', "titular"]

	has_many :deputados_suplentes_comissao, 
			 :class_name => "DeputadoComissao", :source => :deputado_comissao,
			 :conditions => ['deputado_comissoes.cadeira = ?', "suplente"]

	has_many :deputados_titulares, :through => :deputados_titulares_comissao,
			 :class_name => "DeputadoComissao", :source => :deputado_comissao

	has_many :deputados_suplentes, :through => :deputados_suplentes_comissao,
			 :class_name => "DeputadoComissao", :source => :deputado_comissao

	has_many :deputados, :through => :deputados_comissao

	SOAP_FIELDS = :nome, :sigla
end
