require 'spec_helper'

describe Presenca do
  it { should belong_to(:deputado) }
  
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