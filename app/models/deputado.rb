class Deputado < ActiveRecord::Base
	attr_accessible :anexo, :email, :fone, :gabinete, :id_parlamentar, :ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf

	validates_presence_of :email, :fone, :id_parlamentar, :ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf

	SOAP_FIELDS = :anexo, :email, :fone, :gabinete, :id_parlamentar, :ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf
end
