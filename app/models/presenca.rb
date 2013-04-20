class Presenca < ActiveRecord::Base
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
