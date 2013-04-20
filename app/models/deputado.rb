class Deputado < ActiveRecord::Base
	attr_accessible :anexo, :email, :fone, :gabinete, :id_parlamentar, 
		:ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, 
		:sexo, :uf

	validates_presence_of :email, :fone, :id_parlamentar, :ide_cadastro, 
		:matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf

	SOAP_FIELDS = :anexo, :email, :fone, :gabinete, :id_parlamentar, 
		:ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf

	has_many :deputado_comissoes
	has_many :deputado_comissoes_titular,  

	:class_name => "DeputadoComissao", :source => :deputado_comissao,
	:conditions => ['deputado_comissoes.cadeira = ?', "titular"]

	has_many :deputado_comissoes_suplente,  
		:class_name => "DeputadoComissao", :source => :deputado_comissao,
		:conditions => ['deputado_comissoes.cadeira = ?', "suplente"]

	has_many :comissoes, :through => :deputado_comissoes

	has_many :comissoes_titular, :through => :deputado_comissoes_titular,
		:class_name => "Comissao", :source => :comissao

	has_many :comissoes_suplente, :through => :deputado_comissoes_suplente,
		:class_name => "Comissao", :source => :comissao

end
