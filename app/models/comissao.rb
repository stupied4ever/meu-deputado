class Comissao < ActiveRecord::Base
	attr_accessible :nome, :sigla
	validates_presence_of :nome, :sigla

	SOAP_FIELDS = :nome, :sigla
end
