class Presenca < ActiveRecord::Base
  attr_accessible :nome_parlamentar 
  belongs_to :deputado, :primary_key => "nome_parlamentar", :foreign_key => "nome_parlamentar"

  def sessao_camara?
    tipo_sessao == 'camara'
  end

  def sessao_congresso_camara?
    tipo_sessao == 'congresso_camara'
  end

  def sessao_congresso_senado?
    tipo_sessao == 'congresso_senado'
  end
end
