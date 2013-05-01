require 'spec_helper'

describe Presenca do
  it { should belong_to(:deputado) }

  describe 'tipos de sessão' do
    subject {
      FactoryGirl.build(:presenca,
        tipo_sessao:                  tipo_sessao,
        sessao_legislativa_ordinaria: sessao_legislativa_ordinaria,
        sessao_ordinaria:             sessao_ordinaria,
        presente:                     presente
        )
    }

    let(:tipo_sessao) { Presenca::SESSAO_DA_CAMARA }

    let(:sessao_legislativa_ordinaria) { Presenca::SESSAO_ORDINARIA }
    let(:sessao_ordinaria) { Presenca::SESSAO_ORDINARIA }
    let(:presente) { Presenca::PRESENTE }


    describe '#presente' do
      context 'presente' do
        its(:presente?) { should be_true }
      end

      context 'ausente' do
        let(:presente) { Presenca::AUSENTE }
        its(:presente?) { should be_false }
      end
    end

    describe '#sessao_ordinaria' do
      context 'ordinaria' do
        its(:sessao_ordinaria?) { should be_true }
      end

      context 'extraordinaria' do
        let(:sessao_ordinaria) { Presenca::SESSAO_EXTRAORDINARIA }

        its(:sessao_ordinaria?) { should be_false }
      end
    end

    describe '#sessao_legislativa_ordinaria' do
      it { should ensure_inclusion_of(:sessao_legislativa_ordinaria).in_array(Presenca::ORDINARIEDADE_DAS_SESSOES) }

      context 'ordinaria' do
        its(:sessao_legislativa_ordinaria?) { should be_true }
      end

      context 'extraordinaria' do
        let(:sessao_legislativa_ordinaria) { Presenca::SESSAO_EXTRAORDINARIA }

        its(:sessao_legislativa_ordinaria?) { should be_false }
      end
    end

    describe '#tipo_sessao' do
      it {
        should ensure_inclusion_of(:tipo_sessao).in_array(Presenca::TIPOS_DE_SESSOES)
      }

      context '#sessao_camara?' do
        its(:tipo_sessao)              { should eq(tipo_sessao) }
        its(:sessao_camara?)           { should be_true  }
        its(:sessao_congresso_camara?) { should be_false }
        its(:sessao_congresso_senado?) { should be_false }
      end

      context '#sessao_congresso_camara?' do
        let(:tipo_sessao) { Presenca::SESSAO_DO_CONGRESSO_CAMARA }

        its(:tipo_sessao)              { should eq(tipo_sessao) }
        its(:sessao_camara?)           { should be_false }
        its(:sessao_congresso_camara?) { should be_true  }
        its(:sessao_congresso_senado?) { should be_false }
      end

      context '#sessao_congresso_senado?' do
        let(:tipo_sessao) { Presenca::SESSAO_CONGRESSO_SENADO }

        its(:tipo_sessao)              { should eq(tipo_sessao) }
        its(:sessao_camara?)           { should be_false }
        its(:sessao_congresso_camara?) { should be_false }
        its(:sessao_congresso_senado?) { should be_true  }
      end
    end
  end




end