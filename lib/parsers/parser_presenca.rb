class ParserPresenca
  PATTERN = %r{
    (?<tipo_sessao>                   [\w]  {2} ) {0}
    (?<numero_sessao_legislativa>     [\w]  {2} ) {0}
    (?<sessao_legislativa>            [\w]  {1} ) {0}
    (?<sessao_numero>                 [\w]  {3} ) {0}
    (?<sessao_extra_ordinaria>        [\w]  {1} ) {0}
    (?<sequencial_votacao>            [\w]  {6} ) {0}
    (?<nome_parlamentar>              [\w\s]{40} ){0}
    (?<situacao_presenca>       [\w\s\-\<\>]{8}  ){0}
    (?<partido>                 [\w\s\-\<\>]{10} ){0}
    (?<uf>                          [\w\s\-]{25} ){0}
    (?<codigo_parlamentar>          \w\w?\w?     ){0}


    \g<tipo_sessao>\g<numero_sessao_legislativa>
    \g<sessao_legislativa>\g<sessao_numero>
    \g<sessao_extra_ordinaria>\s\g<sequencial_votacao>
    \s\g<nome_parlamentar>\g<situacao_presenca>
    \s\g<partido>\g<uf>\g<codigo_parlamentar>.*
    }x

    def parse(conteudo)
      conteudo.split("\n").map { | registro | parse_registro(registro) }
    end

    def parse_registro(registro)
      informacoes = PATTERN.match(registro)
      Presenca.new(
        tipo_sessao:                  informacoes[:tipo_sessao],
        numero_sessao_legislativa:    informacoes[:numero_sessao_legislativa],
        sessao_legislativa_ordinaria: informacoes[:sessao_legislativa],
        sessao_numero:                informacoes[:sessao_numero],
        sessao_ordinaria:             informacoes[:sessao_extra_ordinaria],
        sequencial_votacao:           informacoes[:sequencial_votacao],
        nome_parlamentar:             informacoes[:nome_parlamentar].strip,
        presente:                     informacoes[:situacao_presenca].strip,
        partido:                      informacoes[:partido].strip,
        uf:                           informacoes[:uf].strip,
        codigo_parlamentar:           informacoes[:codigo_parlamentar].strip,
        )
    end
  end
