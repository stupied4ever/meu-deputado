require 'net/http'

class TransparenciaRequest
	URL_DEPUTADOS_WSDL = "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx?wsdl"

	def obter_deputados
		deputados = executar_request.collect do |attrs|
			id_parlamentar = attrs[:id_parlamentar]
			deputado = Deputado.where(id_parlamentar: id_parlamentar).first_or_create

			deputado.update_attributes( limpar_campos( attrs, Deputado::SOAP_FIELDS ) )
			
			seta_comissoes_na_cadeira(deputado, "titular",  attrs[:comissoes][:titular]  )
			seta_comissoes_na_cadeira(deputado, "suplente", attrs[:comissoes][:suplente] )

			
			deputado
		end

		deputados
	end

	private
	def seta_comissoes_na_cadeira(deputado, cadeira, comissoes_na_cadeira)
		return unless comissoes_na_cadeira
		comissoes_na_cadeira.each do | comissoes |
			comissoes[1] = [comissoes[1]] unless comissoes[1].instance_of?(Array)
			comissoes[1].each do | comissao_attrs |
				comissao = Comissao.where(nome: comissao_attrs[:@nome], sigla: comissao_attrs[:@sigla]).first_or_create
				deputado.deputado_comissoes.create(comissao: comissao, cadeira: cadeira)
			end
		end
	end

	def limpar_campos( fields, campos_aceitos )
		fields.dup.extract!(*campos_aceitos)
	end

	def parse_deputados( hash )
		return [] if hash.nil? || hash.empty?

		hash[:obter_deputados_response][:obter_deputados_result][:deputados][:deputado]
	end

	def executar_request
		client = Savon.client(wsdl: TransparenciaRequest::URL_DEPUTADOS_WSDL)
		response = client.call(:obter_deputados)
		parse_deputados(response.to_hash) if response
	end
end


# def get_discursos_plenario( data_ini: required('data_ini'), data_fim: required('data_fim'), codigo_sessao: nil, parte_nome_parlamentar: nil, sigla_partido: nil, sigla_uf: nil )
# 	message = {
# 		dataIni: data_ini,
# 		dataFim: data_fim,
# 		codigoSessao: codigo_sessao,
# 		parteNomeParlamentar: parte_nome_parlamentar,
# 		siglaPartido: sigla_partido,
# 		siglaUF: sigla_uf
# 	}
# 	client = Savon.client( strip_namespaces: true, wsdl: "http://www.camara.gov.br/sitcamaraws/SessoesReunioes.asmx?WSDL")
# 	response = client.call(:listar_discursos_plenario, message: message)

# 	response.doc.xpath('//sessoesDiscursos/sessao/fasesSessao/faseSessao/discursos/discurso/orador/nome').each do |node|
# 		puts node.text
# 	end
# end

# def required(arg)
# 	raise ArgumentError.new("required #{arg}")
# end
