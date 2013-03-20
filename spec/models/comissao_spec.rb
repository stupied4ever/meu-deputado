require 'spec_helper'

describe Comissao do
	it { should validate_presence_of :nome }
	it { should validate_presence_of :sigla }
end
