class Presenca < ActiveRecord::Base
  attr_accessible :nome_parlamentar,
  :nome_parlamentar, :tipo_sessao, :numero_sessao_legislativa,
  :sessao_legislativa, :sessao_numero, :sessao_extra_ordinaria,
  :sequencial_votacao, :presente, :partido, :uf, :codigo_parlamentar,
  :sessao_legislativa_ordinaria, :sessao_ordinaria

  belongs_to :deputado, :primary_key => "nome_parlamentar", :foreign_key => "nome_parlamentar"


  TIPOS_DE_SESSOES = [
    SESSAO_DA_CAMARA           = 'CD',
    SESSAO_DO_CONGRESSO_CAMARA = 'CC',
    SESSAO_CONGRESSO_SENADO    = 'SF',
  ]
  validates :tipo_sessao, inclusion: { in: TIPOS_DE_SESSOES }


  # TIPOS DE SESSAO SESSAO
  def sessao_camara?
    tipo_sessao == Presenca::SESSAO_DA_CAMARA
  end

  def sessao_congresso_camara?
    tipo_sessao == Presenca::SESSAO_DO_CONGRESSO_CAMARA
  end

  def sessao_congresso_senado?
    tipo_sessao == Presenca::SESSAO_CONGRESSO_SENADO
  end

  ORDINARIEDADE_DAS_SESSOES = [
    SESSAO_ORDINARIA      = 'O',
    SESSAO_EXTRAORDINARIA = 'E'
  ]

  # ORDINARIEDADE DA SESSAO LEGISLATIVA
  validates :sessao_legislativa_ordinaria, inclusion: { in: ORDINARIEDADE_DAS_SESSOES }

  def sessao_legislativa_ordinaria?
    sessao_legislativa_ordinaria == Presenca::SESSAO_ORDINARIA
  end

  # ORDINARIEDADE DA SESSAO
  validates :sessao_ordinaria, inclusion: { in: ORDINARIEDADE_DAS_SESSOES }

  def sessao_ordinaria?
    sessao_ordinaria == Presenca::SESSAO_ORDINARIA
  end

  # PRESENCA
  SITUACAO_PRESENCA = [
    PRESENTE = 'Presente',
    AUSENTE  = '<------>'
  ]
  validates :presente, inclusion: { in: SITUACAO_PRESENCA }

  def presente?
    presente == Presenca::PRESENTE
  end
end
