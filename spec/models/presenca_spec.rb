require 'spec_helper'

describe Presenca do
	it { should respond_to :sessao_camara? }
end


# :tipo_sessao, :numero_sessao_legislativa, :sessao_legislativa,
# 		:sessao_numero, :sessao_extra_ordinaria, :sequencial_votacao,
# 		:nome_parlamentar, :situacao_presenca, :partido, :uf, :codigo_parlamentar
	

# 	def sessao_camara
# 		tipo_sessao == "CD"
# 	end

# 	def sessao_congresso_camara
# 		tipo_sessao == "CC"
# 	end

# 	def sessao_congresso_senado
# 		tipo_sessao == "SF"
# 	end

# 	def sessao_legislativa_ordinaria
# 		sessao_legislativa == "O"
# 	end

# 	def sessao_legislativa_extraordinaria
# 		sessao_legislativa == "E"
# 	end

# 	def sessao_ordinaria
# 		sessao_extra_ordinaria == "O"
# 	end

# 	def sessao_extraordinaria
# 		sessao_extra_ordinaria == "E"
# 	end

# 	def presente
# 		self.situacao_presenca == "Presente"
# 	end