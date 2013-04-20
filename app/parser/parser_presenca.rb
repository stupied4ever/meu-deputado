class ParserPresenca
	PATTERN = %r{
				(?<tipo_sessao> 			  		[\w]  {2} ) {0}
				(?<numero_sessao_legislativa> 		[\w]  {2} ) {0}
				(?<sessao_legislativa> 		  		[\w]  {1} ) {0}
				(?<sessao_numero> 		  	  		[\w]  {3} ) {0}
				(?<sessao_extra_ordinaria> 	  		[\w]  {1} ) {0}
				(?<sequencial_votacao> 	  	  		[\w]  {6} ) {0}
				(?<nome_parlamentar> 	  	  		[\w\s]{40} ){0}
				(?<situacao_presenca> 		  [\w\s\-\<\>]{8}  ){0}
				(?<partido>			 		  [\w\s\-\<\>]{10} ){0}
				(?<uf>				 		  	  [\w\s\-]{25} ){0}
				(?<codigo_parlamentar>				  \w\w?\w?     ){0}
				

				\g<tipo_sessao>\g<numero_sessao_legislativa>\g<sessao_legislativa>\g<sessao_numero>\g<sessao_extra_ordinaria>\s\g<sequencial_votacao>\s\g<nome_parlamentar>\g<situacao_presenca>\s\g<partido>\g<uf>\g<codigo_parlamentar>.*
			}x
	# (?<sessao_legislativa> [\w]{2} ){0}
	attr_accessor :tipo_sessao, :numero_sessao_legislativa, :sessao_legislativa,
		:sessao_numero, :sessao_extra_ordinaria, :sequencial_votacao,
		:nome_parlamentar, :situacao_presenca, :partido, :uf, :codigo_parlamentar
	
	def initialize( linha )
		informacoes = PATTERN.match(linha)
		self.tipo_sessao = informacoes[:tipo_sessao]
		self.numero_sessao_legislativa = informacoes[:numero_sessao_legislativa]
		self.sessao_legislativa = informacoes[:sessao_legislativa]
		self.sessao_numero = informacoes[:sessao_numero]
		self.sessao_extra_ordinaria = informacoes[:sessao_extra_ordinaria]
		self.sequencial_votacao = informacoes[:sequencial_votacao]
		self.nome_parlamentar = informacoes[:nome_parlamentar].strip
		self.situacao_presenca = informacoes[:situacao_presenca].strip
		self.partido = informacoes[:partido].strip
		self.uf = informacoes[:uf].strip
		self.codigo_parlamentar = informacoes[:codigo_parlamentar].strip
		

	end

	def sessao_camara
		tipo_sessao == "CD"
	end

	def sessao_congresso_camara
		tipo_sessao == "CC"
	end

	def sessao_congresso_senado
		tipo_sessao == "SF"
	end

	def sessao_legislativa_ordinaria
		sessao_legislativa == "O"
	end

	def sessao_legislativa_extraordinaria
		sessao_legislativa == "E"
	end

	def sessao_ordinaria
		sessao_extra_ordinaria == "O"
	end

	def sessao_extraordinaria
		sessao_extra_ordinaria == "E"
	end

	def presente
		self.situacao_presenca == "Presente"
	end
end