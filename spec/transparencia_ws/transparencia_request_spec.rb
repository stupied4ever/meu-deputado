require 'spec_helper'

describe TransparenciaRequest do
	let(:deputados){
		YAML.load_file("#{Rails.root}/spec/stub/deputados.yml").each do | deputado |
			HashWithIndifferentAccess.new(deputado)
		end
		
	}

	let(:transparencia_request){
		stub_model( TransparenciaRequest, :executar_request => deputados )
	}

	describe "obtem deputados" do
		subject{ transparencia_request.obter_deputados }

		it "e retorna a lista" do
			subject.map(&:id_parlamentar).should == [1,2]
		end

		describe "com os campos corretos" do
			let(:deputado) { transparencia_request.obter_deputados.first }
			subject{ deputado }

			its(:anexo)    			{ should eq("1_anexo") }
			its(:email)    			{ should eq("1_email") }
			its(:fone)    			{ should eq("1_fone") }
			its(:gabinete)    		{ should eq("1_gabinete") }
			its(:id_parlamentar)    { should eq(1) }
			its(:ide_cadastro)    	{ should eq(12) }
			its(:matricula)    		{ should eq(1) }
			its(:nome)    			{ should eq("1_nome") }
			its(:nome_parlamentar)	{ should eq("1_nome_parlamentar") }
			its(:partido)    		{ should eq("1_partido") }
			its(:sexo)    			{ should eq("1_sexo") }
			its(:uf)    			{ should eq("1_uf") }

			describe ", importa comissoes onde o deputado é titular" do
				let(:comissao)	{ deputado.comissoes_titular.first }
				subject{ comissao }

				its(:nome) { should eq("comissao_1") }
				its(:sigla) { should eq("sigla_1") }
				
				describe "e cria a relacao com o deputado" do
					subject { deputado.deputado_comissoes_titular.first }
					its(:cadeira) { should eq("titular") }
					its(:deputado_id) { should eq(deputado.id) }
					its(:comissao_id) { should eq(comissao.id) }
				end
			end

			describe ", importa comissoes onde o deputado é suplente" do
				let(:comissao)	{ deputado.comissoes_suplente.first }
				subject{ comissao }

				its(:nome) { should eq("comissao_1_1") }
				its(:sigla) { should eq("sigla_1_1") }
				
				describe "e cria a relacao com o deputado" do
					subject { deputado.deputado_comissoes_suplente.first }
					its(:cadeira) { should eq("suplente") }
					its(:deputado_id) { should eq(deputado.id) }
					its(:comissao_id) { should eq(comissao.id) }
				end
			end
		end

		describe "e limpa campos" do
			let(:transparencia_request){
				deputados.last.store(:teste, "teste")
				stub_model( TransparenciaRequest, :executar_request => deputados )
			}

			subject{ transparencia_request.obter_deputados.last }

			it "que nao existem " do
				subject.id_parlamentar.should eq(2)
			end
		end


	end
end
