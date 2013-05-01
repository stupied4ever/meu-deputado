require 'spec_helper'
require 'parsers/parser_presenca'

describe ParserPresenca do
  subject(:parser_presenca) { ParserPresenca.new }

  describe '#parse_registro' do
    subject { parser_presenca.parse_registro(linha) }

    let(:linha) { 'CD03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  ' }

    describe 'Número da Sessão legislativa (2 posições)' do
      its(:numero_sessao_legislativa) { should eq('03')}
    end

    describe 'sessão legislativa ordinária ou extraordinária' do
      context 'ordinaria' do
        its(:sessao_legislativa_ordinaria) { should eq('O')}
      end

      context 'extraordinaria' do
        let(:linha) { 'CD03E051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  ' }
        its(:sessao_legislativa_ordinaria) { should eq('E')}
      end
    end

    describe 'sessao' do
      context 'da camara' do
        its(:tipo_sessao) { should eq("CD")}
      end

      context 'do congresso - camara' do
        let(:linha) { 'CC03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  ' }

        its(:tipo_sessao) { should eq("CC")}
      end

      context 'do congresso - senado' do
        let(:linha) { 'SF03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  ' }

        its(:tipo_sessao) { should eq("SF")}
      end
    end

    describe '#sessao_numero' do
      its(:sessao_numero) { should eq('051') }
    end

    describe 'sessao' do
      context 'ordinaria' do
        its(:sessao_ordinaria) { should eq('O')  }
      end

      context 'extraordinaria' do
        let(:linha) { 'SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  ' }

        its(:sessao_ordinaria) { should eq('E')  }
      end
    end

    describe '#sequencial votacao' do
      its(:sequencial_votacao) { should eq('000000')  }
    end

    describe '#nome do parlamentar' do
      its(:nome_parlamentar) { should eq('CHICO DAS VERDURAS')  }
    end

    describe '#presente' do
      context 'presente' do
        its(:presente) { should eq('Presente') }
      end

      context 'ausente' do
        let(:linha) { 'SF03E051E 000000 CHICO DAS VERDURAS                      <------> PRP       Roraima                  3  ' }

        its(:presente) { should eq('<------>') }
      end
    end

    describe 'partido' do
      its(:partido) { should eq('PRP') }
    end

    describe 'uf' do
      its(:uf) { should eq('Roraima') }
    end

    describe 'codigo parlamentar' do
      its(:codigo_parlamentar) { should eq('3') }
    end
  end
end
