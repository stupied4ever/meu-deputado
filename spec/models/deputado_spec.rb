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
end
