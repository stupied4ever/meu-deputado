require 'spec_helper'
require 'parsers/parser_presenca'

describe ParserPresenca do
	
	subject{ ParserPresenca.new( linha ) }
	
	context "sessao" do
		context "da camara" do
			let(:linha) { 
				"CD03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}
			
			its(:sessao_camara) 		  { should be_true }
			its(:sessao_congresso_camara) { should be_false }
			its(:sessao_congresso_senado) { should be_false }
		end  

		context "do congresso - camara" do
			let(:linha) { 
				"CC03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}
			
			its(:sessao_camara) 		  { should be_false }
			its(:sessao_congresso_camara) { should be_true }
			its(:sessao_congresso_senado) { should be_false }
		end

		context "do congresso - senado" do
			let(:linha) {
				"SF03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}
			
			its(:sessao_camara) 		  { should be_false }
			its(:sessao_congresso_camara) { should be_false }
			its(:sessao_congresso_senado) { should be_true }
		end
	end
	
	context "numero da sessao legislativa" do
		let(:linha) {
			"SF03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}
		
		its(:numero_sessao_legislativa) { should eq("03") }
	end

	context "sessao legislativa" do
		context "ordinaria" do
			let(:linha) {
				"SF03O051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}
			
			its(:sessao_legislativa_ordinaria) 		{ should be_true }
			its(:sessao_legislativa_extraordinaria) { should be_false }
		end

		context "extraordinária" do
			let(:linha) {
				"SF03E051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}
			
			its(:sessao_legislativa_ordinaria) 		{ should be_false }
			its(:sessao_legislativa_extraordinaria) { should be_true  }
		end
	end

	context "sessao numero" do
		let(:linha) {
			"SF03E051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:sessao_numero) { should eq("051") }
	end

	context "sessao numero" do
		let(:linha) {
			"SF03E051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:sessao_numero) { should eq("051") }
	end

	context "sessao" do
		context "ordinaria" do
			let(:linha) {
				"SF03E051O 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}

			its(:sessao_ordinaria) 		{ should be_true  }  
			its(:sessao_extraordinaria) { should be_false } 
		end

		context "extraordinaria" do
			let(:linha) {
				"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}

			its(:sessao_ordinaria) 		{ should be_false  }  
			its(:sessao_extraordinaria) { should be_true   } 
		end
	end
	
	context "sequencial votacao" do
		let(:linha) {
			"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:sequencial_votacao) { should eq("000000")  }  
	end

	context "nome do parlamentar" do

		let(:linha) {
			"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:nome_parlamentar) { should eq("CHICO DAS VERDURAS")  }
	end

	context "estava" do
		context "presente" do
			let(:linha) {
				"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
			}

			its(:presente) { should be_true }
		end

		context "ausente" do
			let(:linha) {
				"SF03E051E 000000 CHICO DAS VERDURAS                      <------> PRP       Roraima                  3  " 
			}

			its(:presente) { should be_false }
		end
	end

	context "partido" do
		let(:linha) {
			"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:partido) { should eq("PRP") }
	end

	context "uf" do
		let(:linha) {
			"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:uf) { should eq("Roraima") }
	end

	context "codigo parlamentar" do
		let(:linha) {
			"SF03E051E 000000 CHICO DAS VERDURAS                      Presente PRP       Roraima                  3  " 
		}

		its(:codigo_parlamentar) { should eq("3") }
	end
	
end
