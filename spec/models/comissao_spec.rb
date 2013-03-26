require 'spec_helper'

describe Comissao do
	it { should validate_presence_of :nome }
	it { should validate_presence_of :sigla }

	it { should have_many(:deputados_comissao) }
	it { should have_many(:deputados).through(:deputados_comissao) }
	
	it { should have_many(:deputados_titulares_comissao) }
	it { should have_many(:deputados_titulares).through(:deputados_titulares_comissao) }

	it { should have_many(:deputados_suplentes_comissao) }
	it { should have_many(:deputados_suplentes).through(:deputados_suplentes_comissao) }
end
