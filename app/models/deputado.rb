class Deputado < ActiveRecord::Base
  attr_accessible :anexo, :email, :fone, :gabinete, :id_parlamentar, 
  :ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, 
  :sexo, :uf

  validates_presence_of :email, :fone, :id_parlamentar, :ide_cadastro, 
  :matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf

  SOAP_FIELDS = :anexo, :email, :fone, :gabinete, :id_parlamentar, 
  :ide_cadastro, :matricula, :nome, :nome_parlamentar, :partido, :sexo, :uf

  has_many :deputado_comissoes
  has_many :deputado_comissoes_titular,  

  :class_name => "DeputadoComissao", :source => :deputado_comissao,
  :conditions => ['deputado_comissoes.cadeira = ?', "titular"]

  has_many :deputado_comissoes_suplente,  
  :class_name => "DeputadoComissao", :source => :deputado_comissao,
  :conditions => ['deputado_comissoes.cadeira = ?', "suplente"]

  has_many :sessoes_presente,
  :class_name  => "Presenca", :source => :presencas,
  :foreign_key => "nome_parlamentar", :primary_key => "nome_parlamentar",
  :conditions => ['presencas.situacao_presenca = ?', true]

  has_many :sessoes_ausente,
  :class_name  => "Presenca", :source => :presencas,
  :foreign_key => "nome_parlamentar", :primary_key => "nome_parlamentar",
  :conditions => ['presencas.situacao_presenca = ?', false]


  

  has_many :comissoes, :through => :deputado_comissoes

  has_many :comissoes_titular, :through => :deputado_comissoes_titular,
  :class_name => "Comissao", :source => :comissao

  has_many :comissoes_suplente, :through => :deputado_comissoes_suplente,
  :class_name => "Comissao", :source => :comissao

  def foto
    "http://www.camara.gov.br/internet/deputado/bandep/#{ide_cadastro}.jpg"
  end	

  def presencas
    self.sessoes_presente.count
  end

  def ausencias
    self.sessoes_ausente.count
  end

  def sessoes
    self.presencas + self.ausencias
  end
end
