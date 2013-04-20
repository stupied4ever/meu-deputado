require 'spec_helper'

describe Presenca do
  describe 'tipos de sessão' do
    subject { FactoryGirl.build(:presenca, tipo_sessao: tipo_sessao) }

    describe '#sessao_camara?' do
      let(:tipo_sessao) { 'camara' }

      its(:sessao_camara?) { should be_true }
    end

    describe '#sessao_congresso_camara?' do
      let(:tipo_sessao) { 'congresso_camara' }

      its(:sessao_congresso_camara?) { should be_true }
    end

    describe '#sessao_congresso_senado?' do
      let(:tipo_sessao) { 'congresso_senado' }

      its(:sessao_congresso_senado?) { should be_true }
    end
  end
end




# :tipo_sessao, :numero_sessao_legislativa, :sessao_legislativa,
#     :sessao_numero, :sessao_extra_ordinaria, :sequencial_votacao,
#     :nome_parlamentar, :situacao_presenca, :partido, :uf, :codigo_parlamentar
  

#   def sessao_camara
#     tipo_sessao == "CD"
#   end

#   def sessao_congresso_camara
#     tipo_sessao == "CC"
#   end

#   def sessao_congresso_senado
#     tipo_sessao == "SF"
#   end

#   def sessao_legislativa_ordinaria
#     sessao_legislativa == "O"
#   end

#   def sessao_legislativa_extraordinaria
#     sessao_legislativa == "E"
#   end

#   def sessao_ordinaria
#     sessao_extra_ordinaria == "O"
#   end

#   def sessao_extraordinaria
#     sessao_extra_ordinaria == "E"
#   end

#   def presente
#     self.situacao_presenca == "Presente"
#   end
