# ============================================================
# SOLUÇÃO DO PROFESSOR
# Processamento de Dados na Engenharia Civil
#
# Estatística Aplicada às Tecnologias e Inovações Construtivas
#
# Base: 100 observações x 10 variáveis
# Linguagem: R - Base R
# ============================================================


# ============================================================
# PREPARAÇÃO
# ============================================================

# Importação da base de dados.
#
# A função read.csv2() é adequada porque a base foi salva com
# separador ";".
#
# stringsAsFactors = FALSE evita que os textos sejam
# automaticamente convertidos em fatores.

dados <- read.csv2(
  "base_processamento_dados_engenharia_civil.csv",
  stringsAsFactors = FALSE,
  check.names = FALSE
)


# ============================================================
# ETAPA 1 — CONHECENDO A BASE
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 1
# Importe a base e atribua-a ao objeto dados.
# ------------------------------------------------------------

# A importação já foi realizada acima.

dados


# ------------------------------------------------------------
# QUESTÃO 2
# Quantas observações e variáveis existem?
# ------------------------------------------------------------

# dim() retorna o número de linhas e colunas.

dim(dados)

# Também podemos utilizar nrow() e ncol() separadamente.

nrow(dados)
ncol(dados)

# Resultado esperado:
# 100 observações
# 10 variáveis


# ------------------------------------------------------------
# QUESTÃO 3
# Apresente a estrutura da base.
# ------------------------------------------------------------

# str() é uma das funções mais importantes para uma primeira
# inspeção de um data.frame.

str(dados)

# Observe especialmente:
#
# - nome das variáveis;
# - tipo de cada variável;
# - quantidade de observações;
# - alguns valores iniciais.
#
# Uma atenção especial deve ser dada às variáveis que deveriam
# ser numéricas, mas podem ter sido importadas como character.


# ------------------------------------------------------------
# QUESTÃO 4
# Apresente um resumo da base.
# ------------------------------------------------------------

summary(dados)

# O summary() fornece informações diferentes conforme o tipo
# da variável.
#
# Para variáveis numéricas:
#   Min., 1st Qu., Median, Mean, 3rd Qu., Max.
#
# Para variáveis de texto:
#   quantidade de ocorrências das categorias.


# ------------------------------------------------------------
# QUESTÃO 5
# Quais são quantitativas e quais são qualitativas?
# ------------------------------------------------------------

sapply(dados, class)

# Outra possibilidade:

str(dados)

# Esperamos:
#
# Qualitativas:
#   id_corpo_prova
#   obra
#   tipo_concreto
#
# Quantitativas:
#   idade_dias
#   resistencia_mpa
#   cimento_kg_m3
#   relacao_a_c
#   abatimento_mm
#   densidade_kg_m3
#   absorção_agregado_pct
#
# Entretanto, alguns erros de digitação fazem com que algumas
# variáveis quantitativas possam ter sido importadas como
# character.


# ------------------------------------------------------------
# QUESTÃO 6
# Verifique os valores ausentes.
# ------------------------------------------------------------

# is.na() identifica os valores ausentes.

is.na(dados)

# Para contar os NA por variável:

colSums(is.na(dados))

# Número total de valores ausentes:

sum(is.na(dados))

# Quantidade de NA por linha:

rowSums(is.na(dados))


# ============================================================
# ETAPA 2 — INVESTIGANDO PROBLEMAS NOS DADOS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 7
# Identifique valores potencialmente incompatíveis.
# ------------------------------------------------------------

# Primeiro vamos observar os valores distintos.

lapply(dados, unique)

# É importante lembrar que "valor estranho" não significa
# automaticamente "valor errado".
#
# O engenheiro precisa investigar o contexto físico antes
# de alterar um registro.


# Resistência:

dados[, c(
  "id_corpo_prova",
  "resistencia_mpa"
)]


# Idade:

dados[, c(
  "id_corpo_prova",
  "idade_dias"
)]


# Abatimento:

dados[, c(
  "id_corpo_prova",
  "abatimento_mm"
)]


# Densidade:

dados[, c(
  "id_corpo_prova",
  "densidade_kg_m3"
)]


# Relação água/cimento:

dados[, c(
  "id_corpo_prova",
  "relacao_a_c"
)]


# Absorção:

dados[, c(
  "id_corpo_prova",
  "absorção_agregado_pct"
)]


# Alguns registros chamam atenção pela ordem de grandeza,
# como valores de abatimento, densidade, idade ou absorção.


# ------------------------------------------------------------
# QUESTÃO 8
# Existem possíveis erros de digitação?
# ------------------------------------------------------------

# Podemos localizar registros que apresentam conteúdos
# suspeitos.

dados[8, ]
dados[19, ]
dados[32, ]
dados[45, ]
dados[53, ]
dados[64, ]
dados[72, ]
dados[85, ]

# Também devemos verificar os registros com NA:

dados[is.na(dados$resistencia_mpa), ]


# ------------------------------------------------------------
# QUESTÃO 9
# Padronização da variável obra.
# ------------------------------------------------------------

unique(dados$obra)

table(dados$obra, useNA = "ifany")

# Procuramos espaços extras:

which(
  dados$obra != trimws(dados$obra)
)

# trimws() remove espaços extras no início e no final do texto.


# ------------------------------------------------------------
# QUESTÃO 10
# Padronização de tipo_concreto.
# ------------------------------------------------------------

unique(dados$tipo_concreto)

table(
  dados$tipo_concreto,
  useNA = "ifany"
)

# Verificação ignorando diferenças entre maiúsculas e minúsculas:

unique(
  toupper(dados$tipo_concreto)
)

# Um registro como "c30" deve representar a mesma categoria
# que "C30", caso essa seja a conclusão após verificar a fonte.


# ------------------------------------------------------------
# QUESTÃO 11
# Por que um erro pode alterar o tipo da variável?
# ------------------------------------------------------------

str(dados)

# Exemplo conceitual:
#
# Se uma coluna contém:
#
# 32.4
# 35.1
# 37.8
# "3O,4"
#
# o R não consegue tratar todos os valores diretamente como
# números e pode interpretar a coluna como character.
#
# Portanto, um único erro de digitação pode afetar a forma
# como toda a variável é armazenada.


# ============================================================
# ETAPA 3 — LIMPEZA DA BASE
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 12
# Crie uma cópia da base.
# ------------------------------------------------------------

dados_limpos <- dados

# A base original deve ser preservada.
#
# Isso é importante porque permite:
#
# 1. comparar os dados antes e depois;
# 2. recuperar a informação original;
# 3. documentar as alterações realizadas.


# ------------------------------------------------------------
# QUESTÃO 13
# Padronize as variáveis qualitativas.
# ------------------------------------------------------------

# Remover espaços extras:

dados_limpos$obra <- trimws(
  dados_limpos$obra
)

# Padronizar maiúsculas/minúsculas:

dados_limpos$tipo_concreto <- toupper(
  trimws(dados_limpos$tipo_concreto)
)

# Conferindo:

unique(dados_limpos$obra)

unique(dados_limpos$tipo_concreto)


# ------------------------------------------------------------
# QUESTÃO 14
# Converter variáveis para os tipos adequados.
# ------------------------------------------------------------

# Primeiro corrigimos alguns problemas de representação.

# Resistência:
#
# Vírgula decimal -> ponto decimal
# Letra O -> zero

dados_limpos$resistencia_mpa <-
  gsub(
    ",",
    ".",
    dados_limpos$resistencia_mpa
  )

dados_limpos$resistencia_mpa <-
  gsub(
    "O",
    "0",
    dados_limpos$resistencia_mpa
  )

dados_limpos$resistencia_mpa <-
  as.numeric(
    dados_limpos$resistencia_mpa
  )


# Relação água/cimento:

dados_limpos$relacao_a_c <-
  gsub(
    ",",
    ".",
    dados_limpos$relacao_a_c
  )

dados_limpos$relacao_a_c <-
  as.numeric(
    dados_limpos$relacao_a_c
  )


# Consumo de cimento:

dados_limpos$cimento_kg_m3 <-
  gsub(
    "O",
    "0",
    dados_limpos$cimento_kg_m3
  )

dados_limpos$cimento_kg_m3 <-
  as.numeric(
    dados_limpos$cimento_kg_m3
  )


# Garantindo que as demais variáveis sejam numéricas:

dados_limpos$idade_dias <-
  as.numeric(dados_limpos$idade_dias)

dados_limpos$abatimento_mm <-
  as.numeric(dados_limpos$abatimento_mm)

dados_limpos$densidade_kg_m3 <-
  as.numeric(dados_limpos$densidade_kg_m3)

dados_limpos$absorção_agregado_pct <-
  as.numeric(
    dados_limpos$absorção_agregado_pct
  )


# Conferindo novamente:

str(dados_limpos)


# ------------------------------------------------------------
# QUESTÃO 15
# Tratamento dos valores ausentes e inconsistentes.
# ------------------------------------------------------------

# Primeiro identificamos os NA:

colSums(
  is.na(dados_limpos)
)


# Neste exercício, os valores ausentes serão mantidos.
#
# Em uma situação profissional, a decisão poderia ser:
#
# - consultar a ficha original;
# - repetir o ensaio;
# - excluir a observação;
# - utilizar algum método de imputação;
# - manter o NA.
#
# Não devemos simplesmente inventar um valor.


# Agora corrigimos alguns erros de escala claramente
# identificáveis pelo contexto da base.

# 1250 mm -> 125 mm

dados_limpos$abatimento_mm[
  dados_limpos$abatimento_mm == 1250
] <- 125


# 238 kg/m3 -> 2380 kg/m3

dados_limpos$densidade_kg_m3[
  dados_limpos$densidade_kg_m3 == 238
] <- 2380


# 18.4% -> 1.84%

dados_limpos$absorção_agregado_pct[
  dados_limpos$absorção_agregado_pct == 18.4
] <- 1.84


# 280 dias -> 28 dias
#
# ATENÇÃO:
# Essa correção é uma decisão baseada no padrão da base.
# Em um projeto real, deveríamos confirmar a ficha do ensaio.

dados_limpos$idade_dias[
  dados_limpos$idade_dias == 280
] <- 28


# ------------------------------------------------------------
# QUESTÃO 16
# Verificação depois da limpeza.
# ------------------------------------------------------------

str(dados_limpos)

summary(dados_limpos)

colSums(
  is.na(dados_limpos)
)


# ============================================================
# ETAPA 4 — EXPLORAÇÃO DOS DADOS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 17
# Resistência média.
# ------------------------------------------------------------

# Média geral:

mean(
  dados_limpos$resistencia_mpa,
  na.rm = TRUE
)


# Média por obra:

tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$obra,
  mean,
  na.rm = TRUE
)


# Média por tipo de concreto:

tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$tipo_concreto,
  mean,
  na.rm = TRUE
)


# Média por idade:

tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$idade_dias,
  mean,
  na.rm = TRUE
)


# ------------------------------------------------------------
# QUESTÃO 18
# Comparação entre obras.
# ------------------------------------------------------------

medias_obra <- tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$obra,
  mean,
  na.rm = TRUE
)

medias_obra


# Obra com maior média:

names(
  which.max(medias_obra)
)


# Obra com menor média:

names(
  which.min(medias_obra)
)


# ------------------------------------------------------------
# QUESTÃO 19
# Resistência média por tipo de concreto.
# ------------------------------------------------------------

medias_tipo <- tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$tipo_concreto,
  mean,
  na.rm = TRUE
)

medias_tipo

names(
  which.max(medias_tipo)
)


# ------------------------------------------------------------
# QUESTÃO 20
# aggregate()
# ------------------------------------------------------------

aggregate(
  cbind(
    resistencia_mpa,
    cimento_kg_m3,
    relacao_a_c,
    abatimento_mm,
    densidade_kg_m3
  ) ~ tipo_concreto,
  data = dados_limpos,
  FUN = function(x)
    mean(x, na.rm = TRUE)
)


# ============================================================
# ETAPA 5 — CRIAÇÃO DE NOVAS VARIÁVEIS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 21
# Resistência relativa.
# ------------------------------------------------------------

# Criamos um vetor contendo a resistência de referência de
# cada classe.

resistencia_referencia <- c(
  C25 = 25,
  C30 = 30,
  C35 = 35,
  C40 = 40
)


# A indexação pelo nome permite associar cada corpo de prova
# à resistência de referência correspondente à sua classe.

dados_limpos$resistencia_ref <-
  resistencia_referencia[
    dados_limpos$tipo_concreto
  ]


# Resistência relativa:

dados_limpos$resistencia_relativa <-
  dados_limpos$resistencia_mpa /
  dados_limpos$resistencia_ref


# Visualização:

head(
  dados_limpos[
    ,
    c(
      "tipo_concreto",
      "resistencia_mpa",
      "resistencia_ref",
      "resistencia_relativa"
    )
  ]
)


# ------------------------------------------------------------
# QUESTÃO 22
# Classificação.
# ------------------------------------------------------------

# Um critério possível:
#
# resistência relativa >= 1:
# atingiu ou superou a referência
#
# resistência relativa < 1:
# abaixo da referência

dados_limpos$classificacao <-
  ifelse(
    is.na(dados_limpos$resistencia_relativa),
    NA,
    ifelse(
      dados_limpos$resistencia_relativa >= 1,
      "Atingiu ou superou",
      "Abaixo da referência"
    )
  )


table(
  dados_limpos$classificacao,
  useNA = "ifany"
)


# ------------------------------------------------------------
# QUESTÃO 23
# Acima ou abaixo da média do próprio tipo de concreto.
# ------------------------------------------------------------

media_tipo_observacao <- ave(
  dados_limpos$resistencia_mpa,
  dados_limpos$tipo_concreto,
  FUN = function(x)
    mean(x, na.rm = TRUE)
)


dados_limpos$acima_media <-
  dados_limpos$resistencia_mpa >
  media_tipo_observacao


# Como NA > média resulta em NA, mantemos explicitamente
# essa informação.

dados_limpos$acima_media[
  is.na(dados_limpos$resistencia_mpa)
] <- NA


table(
  dados_limpos$acima_media,
  useNA = "ifany"
)


# ============================================================
# ETAPA 6 — split(), lapply() e sapply()
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 24
# Dividir a base por tipo de concreto.
# ------------------------------------------------------------

dados_split <-
  split(
    dados_limpos,
    dados_limpos$tipo_concreto
  )


# Número de observações em cada grupo:

sapply(
  dados_split,
  nrow
)


# ------------------------------------------------------------
# QUESTÃO 25
# Resistência média utilizando lapply().
# ------------------------------------------------------------

medias_lapply <-
  lapply(
    dados_split,
    function(x)
      mean(
        x$resistencia_mpa,
        na.rm = TRUE
      )
  )

medias_lapply


# O resultado é uma LISTA.


# ------------------------------------------------------------
# QUESTÃO 26
# Repetir utilizando sapply().
# ------------------------------------------------------------

medias_sapply <-
  sapply(
    dados_split,
    function(x)
      mean(
        x$resistencia_mpa,
        na.rm = TRUE
      )
  )

medias_sapply


# A principal diferença é:
#
# lapply() -> retorna uma lista
#
# sapply() -> tenta simplificar a lista para um vetor ou matriz.


# ============================================================
# ETAPA 7 — apply()
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 27
# Média das variáveis quantitativas.
# ------------------------------------------------------------

variaveis_numericas <-
  dados_limpos[
    ,
    c(
      "idade_dias",
      "resistencia_mpa",
      "cimento_kg_m3",
      "relacao_a_c",
      "abatimento_mm",
      "densidade_kg_m3",
      "absorção_agregado_pct"
    )
  ]


apply(
  variaveis_numericas,
  2,
  mean,
  na.rm = TRUE
)


# O argumento 2 indica que a função será aplicada às COLUNAS.


# ------------------------------------------------------------
# QUESTÃO 28
# Medida resumo por observação.
# ------------------------------------------------------------

resultado_apply <-
  apply(
    variaveis_numericas,
    1,
    mean,
    na.rm = TRUE
  )

resultado_apply


# O argumento 1 indica que a função é aplicada às LINHAS.
#
# ATENÇÃO:
#
# Embora o cálculo seja matematicamente possível, não devemos
# interpretar essa média como uma grandeza física diretamente.
#
# Por quê?
#
# Porque estamos combinando:
#
# - dias;
# - MPa;
# - kg/m3;
# - relação a/c;
# - mm;
# - kg/m3;
# - %.
#
# São grandezas com unidades e significados diferentes.


# ============================================================
# ETAPA 8 — for e if
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 29
# Utilizar for e if.
# ------------------------------------------------------------

medias_tipo <-
  tapply(
    dados_limpos$resistencia_mpa,
    dados_limpos$tipo_concreto,
    mean,
    na.rm = TRUE
  )


acima_media_for <-
  rep(
    NA,
    nrow(dados_limpos)
  )


for (i in 1:nrow(dados_limpos)) {

  if (!is.na(
    dados_limpos$resistencia_mpa[i]
  )) {

    tipo_atual <-
      dados_limpos$tipo_concreto[i]

    if (
      dados_limpos$resistencia_mpa[i] >
      medias_tipo[tipo_atual]
    ) {

      acima_media_for[i] <- TRUE

    } else {

      acima_media_for[i] <- FALSE

    }

  }

}


acima_media_for


# ------------------------------------------------------------
# QUESTÃO 30
# Solução vetorizada.
# ------------------------------------------------------------

acima_media_vetorizado <-
  dados_limpos$resistencia_mpa >
  ave(
    dados_limpos$resistencia_mpa,
    dados_limpos$tipo_concreto,
    FUN = function(x)
      mean(x, na.rm = TRUE)
  )


acima_media_vetorizado[
  is.na(dados_limpos$resistencia_mpa)
] <- NA


# Comparando as duas soluções:

table(
  acima_media_for,
  acima_media_vetorizado,
  useNA = "ifany"
)


# A abordagem vetorizada é mais compacta.
#
# Porém, o uso de for e if é importante para compreender
# estruturas de repetição e controle de fluxo.


# ============================================================
# ETAPA 9 — SITUAÇÕES PROFISSIONAIS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 31
# O Bloco C apresenta desempenho superior?
# ------------------------------------------------------------

resistencia_obra <-
  aggregate(
    resistencia_mpa ~ obra,
    data = dados_limpos,
    FUN = function(x)
      mean(x, na.rm = TRUE)
  )


resistencia_obra


# Localizando a maior média:

resistencia_obra[
  which.max(
    resistencia_obra$resistencia_mpa
  ),
]


# A afirmação pode ser investigada DESCRITIVAMENTE.
#
# Importante:
#
# Uma diferença entre médias não significa automaticamente
# que exista diferença estatisticamente significativa.
#
# Para isso seria necessário um procedimento inferencial.


# ------------------------------------------------------------
# QUESTÃO 32
# Consumo de cimento x resistência.
# ------------------------------------------------------------

aggregate(
  cbind(
    cimento_kg_m3,
    resistencia_mpa
  ) ~ tipo_concreto,
  data = dados_limpos,
  FUN = function(x)
    mean(x, na.rm = TRUE)
)


# A comparação por tipo de concreto permite observar se grupos
# com maior consumo médio de cimento também apresentam maior
# resistência média.
#
# Entretanto, isso não demonstra causalidade.


# ------------------------------------------------------------
# QUESTÃO 33
# Relação água/cimento x resistência.
# ------------------------------------------------------------

aggregate(
  cbind(
    relacao_a_c,
    resistencia_mpa
  ) ~ tipo_concreto,
  data = dados_limpos,
  FUN = function(x)
    mean(x, na.rm = TRUE)
)


# Correlação global:

cor(
  dados_limpos$relacao_a_c,
  dados_limpos$resistencia_mpa,
  use = "complete.obs"
)


# A correlação fornece uma medida de associação linear.
#
# Porém, devemos ter cuidado porque tipo de concreto e idade
# também podem influenciar a resistência.


# ------------------------------------------------------------
# QUESTÃO 34
# Resistência segundo a idade.
# ------------------------------------------------------------

resistencia_idade <-
  aggregate(
    resistencia_mpa ~ idade_dias,
    data = dados_limpos,
    FUN = function(x)
      mean(x, na.rm = TRUE)
  )


resistencia_idade


# Podemos observar como a média da resistência varia com a idade.
#
# Em um estudo profissional, seria interessante complementar
# essa análise com gráficos e métodos inferenciais.


# ------------------------------------------------------------
# QUESTÃO 35
# Cinco informações para o relatório.
# ------------------------------------------------------------

# 1. Quantidade de observações válidas:

sum(
  !is.na(
    dados_limpos$resistencia_mpa
  )
)


# 2. Resistência média:

mean(
  dados_limpos$resistencia_mpa,
  na.rm = TRUE
)


# 3. Resistência por tipo:

tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$tipo_concreto,
  mean,
  na.rm = TRUE
)


# 4. Resistência por obra:

tapply(
  dados_limpos$resistencia_mpa,
  dados_limpos$obra,
  mean,
  na.rm = TRUE
)


# 5. Quantidade de valores ausentes:

colSums(
  is.na(dados_limpos)
)


# Outras informações poderiam ser incluídas:
#
# - mediana;
# - desvio-padrão;
# - mínimo e máximo;
# - coeficiente de variação;
# - distribuição por idade;
# - relação água/cimento;
# - indicadores de conformidade.
#
# A escolha depende do objetivo do relatório.


# ============================================================
# DESAFIO FINAL
# ============================================================


# A seguir apresentamos uma solução possível para o desafio.
#
# O objetivo não é produzir necessariamente o único código
# correto, mas mostrar como organizar um fluxo de trabalho
# reprodutível.


# ------------------------------------------------------------
# 1. Diagnóstico inicial
# ------------------------------------------------------------

str(dados)

summary(dados)

colSums(
  is.na(dados)
)


# ------------------------------------------------------------
# 2. Criar uma cópia
# ------------------------------------------------------------

dados_final <-
  dados


# ------------------------------------------------------------
# 3. Padronizar textos
# ------------------------------------------------------------

dados_final$obra <-
  trimws(
    dados_final$obra
  )


dados_final$tipo_concreto <-
  toupper(
    trimws(
      dados_final$tipo_concreto
    )
  )


# ------------------------------------------------------------
# 4. Corrigir representações numéricas
# ------------------------------------------------------------

dados_final$resistencia_mpa <-
  gsub(
    ",",
    ".",
    dados_final$resistencia_mpa
  )


dados_final$resistencia_mpa <-
  gsub(
    "O",
    "0",
    dados_final$resistencia_mpa
  )


dados_final$resistencia_mpa <-
  as.numeric(
    dados_final$resistencia_mpa
  )


dados_final$relacao_a_c <-
  gsub(
    ",",
    ".",
    dados_final$relacao_a_c
  )


dados_final$relacao_a_c <-
  as.numeric(
    dados_final$relacao_a_c
  )


dados_final$cimento_kg_m3 <-
  gsub(
    "O",
    "0",
    dados_final$cimento_kg_m3
  )


dados_final$cimento_kg_m3 <-
  as.numeric(
    dados_final$cimento_kg_m3
  )


# ------------------------------------------------------------
# 5. Garantir tipos numéricos
# ------------------------------------------------------------

dados_final$idade_dias <-
  as.numeric(
    dados_final$idade_dias
  )


dados_final$abatimento_mm <-
  as.numeric(
    dados_final$abatimento_mm
  )


dados_final$densidade_kg_m3 <-
  as.numeric(
    dados_final$densidade_kg_m3
  )


dados_final$absorção_agregado_pct <-
  as.numeric(
    dados_final$absorção_agregado_pct
  )


# ------------------------------------------------------------
# 6. Corrigir erros evidentes de escala
# ------------------------------------------------------------

dados_final$abatimento_mm[
  dados_final$abatimento_mm == 1250
] <- 125


dados_final$densidade_kg_m3[
  dados_final$densidade_kg_m3 == 238
] <- 2380


dados_final$absorção_agregado_pct[
  dados_final$absorção_agregado_pct == 18.4
] <- 1.84


dados_final$idade_dias[
  dados_final$idade_dias == 280
] <- 28


# ------------------------------------------------------------
# 7. Criar variáveis derivadas
# ------------------------------------------------------------

referencia <-
  c(
    C25 = 25,
    C30 = 30,
    C35 = 35,
    C40 = 40
  )


dados_final$resistencia_ref <-
  referencia[
    dados_final$tipo_concreto
  ]


dados_final$resistencia_relativa <-
  dados_final$resistencia_mpa /
  dados_final$resistencia_ref


dados_final$classificacao <-
  ifelse(
    dados_final$resistencia_relativa >= 1,
    "Atingiu ou superou",
    "Abaixo da referência"
  )


# ------------------------------------------------------------
# 8. Resumo final
# ------------------------------------------------------------

summary(
  dados_final
)


# ------------------------------------------------------------
# 9. Resumo por tipo de concreto
# ------------------------------------------------------------

aggregate(
  cbind(
    resistencia_mpa,
    cimento_kg_m3,
    relacao_a_c,
    abatimento_mm,
    densidade_kg_m3
  ) ~ tipo_concreto,
  data = dados_final,
  FUN = function(x)
    mean(x, na.rm = TRUE)
)


# ------------------------------------------------------------
# 10. Resumo por obra
# ------------------------------------------------------------

aggregate(
  resistencia_mpa ~ obra,
  data = dados_final,
  FUN = function(x)
    mean(x, na.rm = TRUE)
)


# ------------------------------------------------------------
# 11. Relatório de valores ausentes
# ------------------------------------------------------------

colSums(
  is.na(dados_final)
)


# ------------------------------------------------------------
# 12. Verificação final da estrutura
# ------------------------------------------------------------

str(
  dados_final
)


# ============================================================
# REFLEXÃO FINAL
# ============================================================

# O processamento dos dados é fundamental porque uma análise
# estatística só é confiável quando os dados utilizados foram
# adequadamente examinados.
#
# Nesta atividade foram encontrados problemas como:
#
# - valores ausentes;
# - erros de digitação;
# - inconsistência entre maiúsculas e minúsculas;
# - espaços extras;
# - representação decimal diferente;
# - valores com ordem de grandeza incompatível.
#
# Uma decisão importante do profissional é NÃO modificar
# automaticamente todo valor considerado estranho.
#
# Sempre que possível, deve-se consultar:
#
# - ficha de ensaio;
# - caderno de campo;
# - planilha original;
# - sistema de coleta;
# - responsável pela medição.
#
# O R é uma ferramenta para auxiliar o engenheiro a detectar
# problemas, organizar os dados e produzir informações.
# A decisão sobre a validade de uma informação continua
# dependendo do conhecimento do problema de Engenharia Civil.
