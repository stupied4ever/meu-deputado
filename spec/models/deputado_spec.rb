require 'spec_helper'

describe Deputado do
  it { should validate_presence_of :email }
  it { should validate_presence_of :fone }
  it { should validate_presence_of :id_parlamentar }
  it { should validate_presence_of :ide_cadastro }
  it { should validate_presence_of :matricula }
  it { should validate_presence_of :nome }
  it { should validate_presence_of :nome_parlamentar }
  it { should validate_presence_of :partido }
  it { should validate_presence_of :sexo }
  it { should validate_presence_of :uf }

  it { should have_many(:deputado_comissoes) }
  it { should have_many(:deputado_comissoes_titular) }
  it { should have_many(:deputado_comissoes_suplente) }
  it { should have_many(:comissoes).through(:deputado_comissoes) }
  it { should have_many(:comissoes_titular).through(:deputado_comissoes_titular) }
  it { should have_many(:comissoes_suplente).through(:deputado_comissoes_suplente) }

  context "tem um scopo para presenca" do
    it { should have_many(:sessoes_presente) }
    it { should have_many(:sessoes_ausente) }

    subject{
      nome_parlamentar = "nome do parlamentar"
      FactoryGirl.create(:presenca, 
        :nome_parlamentar => nome_parlamentar, :situacao_presenca => true 
        )
      FactoryGirl.create(:presenca, 
        :nome_parlamentar => nome_parlamentar, :situacao_presenca => true 
        )
      FactoryGirl.create(:presenca, 
        :nome_parlamentar => nome_parlamentar, :situacao_presenca => false 
        )

      FactoryGirl.create(:deputado, :nome_parlamentar => nome_parlamentar)
    }
    
    its(:presencas) { should == 2 }
    its(:ausencias) { should == 1 }
    its(:sessoes)   { should == 3 }
  end
end
