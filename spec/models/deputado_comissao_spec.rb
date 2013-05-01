require 'spec_helper'

describe DeputadoComissao do
	it { should validate_presence_of :cadeira }	
	it { should validate_presence_of :deputado }
	it { should validate_presence_of :comissao }

	it { should belong_to(:deputado) }
	it { should belong_to(:comissao) }

	it { should ensure_inclusion_of(:cadeira).in_array( %w(titular suplente) ) }
	it { should validate_uniqueness_of(:cadeira).scoped_to(:comissao_id, :deputado_id) }
	
end
