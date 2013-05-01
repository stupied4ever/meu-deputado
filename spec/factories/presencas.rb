FactoryGirl.define do
  factory :presenca do
    nome_parlamentar             "nome do parlamentar"
    sessao_legislativa_ordinaria Presenca::SESSAO_ORDINARIA
    tipo_sessao                  Presenca::SESSAO_DO_CONGRESSO_CAMARA
    sessao_ordinaria             Presenca::SESSAO_ORDINARIA
    presente                     Presenca::PRESENTE
  end
end
