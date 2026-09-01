# ============================================================
# RELATÓRIO 03
# Estatística Aplicada às Tecnologias e Inovações Construtivas
#
# SOLUÇÃO — TIDYVERSE
# ============================================================


# ============================================================
# 0. PREPARAÇÃO
# ============================================================

# Instalar, se necessário:
# install.packages("tidyverse")

library(tidyverse)


# ============================================================
# ETAPA 1 — CONHECENDO A BASE
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 1
# Importação da base
# ------------------------------------------------------------

dados <- read_csv2(
  "base_processamento_dados_engenharia_civil.csv",
  show_col_types = FALSE
)

# Primeiras observações
head(dados)

# Últimas observações
tail(dados)

# Visualização compacta
dados


# ------------------------------------------------------------
# QUESTÃO 2
# Número de observações e variáveis
# ------------------------------------------------------------

# Número de observações
nrow(dados)

# Número de variáveis
ncol(dados)

# Uma alternativa utilizando dimensions
dim(dados)


# ------------------------------------------------------------
# QUESTÃO 3
# Estrutura da base
# ------------------------------------------------------------

glimpse(dados)


# ------------------------------------------------------------
# QUESTÃO 4
# Resumo das variáveis
# ------------------------------------------------------------

summary(dados)

# Resumo utilizando dplyr
dados |>
  summarise(
    across(
      where(is.numeric),
      list(
        media = ~ mean(.x, na.rm = TRUE),
        mediana = ~ median(.x, na.rm = TRUE),
        minimo = ~ min(.x, na.rm = TRUE),
        maximo = ~ max(.x, na.rm = TRUE)
      )
    )
  )


# ------------------------------------------------------------
# QUESTÃO 5
# Identificação dos tipos das variáveis
# ------------------------------------------------------------

glimpse(dados)

# Classes das variáveis
map_chr(dados, class)

# Variáveis quantitativas
dados |>
  select(where(is.numeric)) |>
  names()

# Variáveis não quantitativas
dados |>
  select(where(~ !is.numeric(.x))) |>
  names()


# ------------------------------------------------------------
# QUESTÃO 6
# Valores ausentes
# ------------------------------------------------------------

# Número de NA por variável
dados |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )

# Total de valores ausentes
dados |>
  summarise(
    total_NA = sum(is.na(pick(everything())))
  )

# Observações que possuem pelo menos um NA
dados |>
  filter(
    if_any(everything(), is.na)
  )

# Quantidade de observações com pelo menos um NA
dados |>
  filter(
    if_any(everything(), is.na)
  ) |>
  nrow()


# ============================================================
# ETAPA 2 — INVESTIGANDO PROBLEMAS NOS DADOS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 7
# Valores potencialmente incompatíveis
# ------------------------------------------------------------

# Resistência
dados |>
  filter(
    resistencia_mpa < 10 |
      resistencia_mpa > 100
  )

# Idade
dados |>
  filter(
    idade_dias <= 0 |
      idade_dias > 365
  )

# Abatimento
dados |>
  filter(
    abatimento_mm < 0 |
      abatimento_mm > 300
  )

# Densidade
dados |>
  filter(
    densidade_kg_m3 < 1800 |
      densidade_kg_m3 > 2600
  )

# Relação água/cimento
dados |>
  filter(
    relacao_a_c < 0.20 |
      relacao_a_c > 1
  )

# Absorção
dados |>
  filter(
    `absorção_agregado_pct` < 0 |
      `absorção_agregado_pct` > 20
  )


# Podemos reunir algumas condições em uma única investigação

dados |>
  filter(
    idade_dias <= 0 |
      idade_dias > 365 |
      resistencia_mpa < 10 |
      resistencia_mpa > 100 |
      abatimento_mm < 0 |
      abatimento_mm > 300 |
      densidade_kg_m3 < 1800 |
      densidade_kg_m3 > 2600 |
      relacao_a_c < 0.20 |
      relacao_a_c > 1 |
      `absorção_agregado_pct` < 0 |
      `absorção_agregado_pct` > 20
  )


# ------------------------------------------------------------
# QUESTÃO 8
# Possíveis erros de digitação
# ------------------------------------------------------------

# Uma primeira investigação pode ser feita observando
# valores distintos das variáveis qualitativas.

dados |>
  distinct(obra) |>
  arrange(obra)

dados |>
  distinct(tipo_concreto) |>
  arrange(tipo_concreto)


# Para localizar registros suspeitos, podemos combinar
# condições de valores incompatíveis.

dados |>
  filter(
    resistencia_mpa < 10 |
      resistencia_mpa > 100 |
      abatimento_mm > 300 |
      densidade_kg_m3 < 1800 |
      densidade_kg_m3 > 2600 |
      idade_dias > 365 |
      relacao_a_c < 0.20 |
      relacao_a_c > 1 |
      `absorção_agregado_pct` > 20
  )


# ------------------------------------------------------------
# QUESTÃO 9
# Padronização da variável obra
# ------------------------------------------------------------

# Categorias existentes
dados |>
  count(obra, sort = TRUE)

# Removendo espaços para investigar melhor
dados |>
  mutate(
    obra_padronizada = str_trim(obra)
  ) |>
  count(obra_padronizada, sort = TRUE)


# ------------------------------------------------------------
# QUESTÃO 10
# Padronização de tipo_concreto
# ------------------------------------------------------------

dados |>
  count(tipo_concreto, sort = TRUE)

# Padronização preliminar
dados |>
  mutate(
    tipo_concreto_padronizado =
      tipo_concreto |>
      str_trim() |>
      str_to_upper()
  ) |>
  count(tipo_concreto_padronizado, sort = TRUE)


# ------------------------------------------------------------
# QUESTÃO 11
# Verificação dos tipos
# ------------------------------------------------------------

glimpse(dados)

map_chr(dados, class)


# ============================================================
# ETAPA 3 — LIMPEZA DA BASE
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 12
# Criar dados_limpos
# ------------------------------------------------------------

dados_limpos <- dados

# A base original continua preservada
dados


# ------------------------------------------------------------
# QUESTÃO 13
# Limpeza das variáveis qualitativas
# ------------------------------------------------------------

dados_limpos <- dados_limpos |>
  mutate(
    obra = obra |>
      str_trim() |>
      str_to_upper(),
    
    tipo_concreto = tipo_concreto |>
      str_trim() |>
      str_to_upper()
  )

# Verificar
dados_limpos |>
  count(obra)

dados_limpos |>
  count(tipo_concreto)


# ------------------------------------------------------------
# QUESTÃO 14
# Conversão das variáveis quantitativas
# ------------------------------------------------------------

# Primeiro investigamos as variáveis
glimpse(dados_limpos)

# Exemplo de tratamento da resistência:
#
# Como a base pode conter vírgula decimal e caracteres
# indevidos, utilizamos funções de string antes da conversão.

dados_limpos <- dados_limpos |>
  mutate(
    resistencia_mpa = resistencia_mpa |>
      as.character() |>
      str_replace_all(",", ".") |>
      str_replace_all("[^0-9.-]", "") |>
      as.numeric()
  )


# Outras variáveis quantitativas

dados_limpos <- dados_limpos |>
  mutate(
    idade_dias = as.numeric(idade_dias),
    
    cimento_kg_m3 = as.numeric(cimento_kg_m3),
    
    relacao_a_c = as.numeric(relacao_a_c),
    
    abatimento_mm = as.numeric(abatimento_mm),
    
    densidade_kg_m3 = as.numeric(densidade_kg_m3),
    
    `absorção_agregado_pct` =
      `absorção_agregado_pct` |>
      as.character() |>
      str_replace_all(",", ".") |>
      as.numeric()
  )


# Verificar novamente
glimpse(dados_limpos)


# ------------------------------------------------------------
# QUESTÃO 15
# Investigação dos valores ausentes
# ------------------------------------------------------------

dados_limpos |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )


# Registros contendo NA
dados_limpos |>
  filter(
    if_any(everything(), is.na)
  )


# Neste exemplo, não devemos simplesmente substituir todos
# os valores ausentes.
#
# Uma decisão tecnicamente adequada é:
#
# 1. investigar a fonte original;
# 2. manter NA quando não houver informação confiável;
# 3. evitar imputações arbitrárias;
# 4. excluir observações somente quando a análise específica
#    exigir a ausência de NA.


# ------------------------------------------------------------
# QUESTÃO 16
# Verificação após a limpeza
# ------------------------------------------------------------

glimpse(dados_limpos)

summary(dados_limpos)

# Categorias
dados_limpos |>
  count(obra)

dados_limpos |>
  count(tipo_concreto)


# ============================================================
# ETAPA 4 — EXPLORANDO OS DADOS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 17
# Resistência média
# ------------------------------------------------------------

# Média geral
dados_limpos |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE)
  )


# Média por obra
dados_limpos |>
  group_by(obra) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    n = sum(!is.na(resistencia_mpa)),
    .groups = "drop"
  )


# Média por tipo de concreto
dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    n = sum(!is.na(resistencia_mpa)),
    .groups = "drop"
  )


# Média por idade
dados_limpos |>
  group_by(idade_dias) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    n = sum(!is.na(resistencia_mpa)),
    .groups = "drop"
  )


# ------------------------------------------------------------
# QUESTÃO 18
# Comparação entre obras
# ------------------------------------------------------------

resistencia_obra <- dados_limpos |>
  group_by(obra) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    .groups = "drop"
  ) |>
  arrange(desc(resistencia_media))

resistencia_obra

# Maior média
resistencia_obra |>
  slice_max(resistencia_media, n = 1)

# Menor média
resistencia_obra |>
  slice_min(resistencia_media, n = 1)


# ------------------------------------------------------------
# QUESTÃO 19
# Resistência por classe
# ------------------------------------------------------------

resistencia_tipo <- dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    .groups = "drop"
  ) |>
  arrange(desc(resistencia_media))

resistencia_tipo


# ------------------------------------------------------------
# QUESTÃO 20
# Estatísticas por tipo de concreto
# ------------------------------------------------------------

dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    cimento_medio =
      mean(cimento_kg_m3, na.rm = TRUE),
    
    relacao_ac_media =
      mean(relacao_a_c, na.rm = TRUE),
    
    abatimento_medio =
      mean(abatimento_mm, na.rm = TRUE),
    
    densidade_media =
      mean(densidade_kg_m3, na.rm = TRUE),
    
    .groups = "drop"
  )


# ============================================================
# ETAPA 5 — CRIANDO NOVAS VARIÁVEIS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 21
# Resistência relativa
# ------------------------------------------------------------

# Definição das resistências de referência
#
# C25 -> 25 MPa
# C30 -> 30 MPa
# C35 -> 35 MPa
# C40 -> 40 MPa

dados_limpos <- dados_limpos |>
  mutate(
    resistencia_referencia = case_when(
      tipo_concreto == "C25" ~ 25,
      tipo_concreto == "C30" ~ 30,
      tipo_concreto == "C35" ~ 35,
      tipo_concreto == "C40" ~ 40,
      TRUE ~ NA_real_
    )
  ) |>
  mutate(
    resistencia_relativa =
      resistencia_mpa / resistencia_referencia
  )

dados_limpos |>
  select(
    id_corpo_prova,
    tipo_concreto,
    resistencia_mpa,
    resistencia_referencia,
    resistencia_relativa
  )


# ------------------------------------------------------------
# QUESTÃO 22
# Classificação
# ------------------------------------------------------------

# Critério adotado:
#
# >= 1,00 -> atende ou supera a resistência de referência
# 0,90 a < 1,00 -> próximo da referência
# < 0,90 -> abaixo da referência

dados_limpos <- dados_limpos |>
  mutate(
    classificacao = case_when(
      resistencia_relativa >= 1 ~
        "Atende ou supera",
      
      resistencia_relativa >= 0.90 ~
        "Próximo da referência",
      
      resistencia_relativa < 0.90 ~
        "Abaixo da referência",
      
      TRUE ~ NA_character_
    )
  )

dados_limpos |>
  count(classificacao)


# ------------------------------------------------------------
# QUESTÃO 23
# Acima da média da própria classe
# ------------------------------------------------------------

dados_limpos <- dados_limpos |>
  group_by(tipo_concreto) |>
  mutate(
    media_tipo =
      mean(resistencia_mpa, na.rm = TRUE),
    
    acima_media =
      resistencia_mpa > media_tipo
  ) |>
  ungroup()

dados_limpos |>
  select(
    id_corpo_prova,
    tipo_concreto,
    resistencia_mpa,
    media_tipo,
    acima_media
  )


# ============================================================
# ETAPA 6 — DADOS AGRUPADOS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 24
# Número de observações por tipo
# ------------------------------------------------------------

dados_limpos |>
  count(tipo_concreto, name = "n")


# ------------------------------------------------------------
# QUESTÃO 25
# Resistência média por tipo
# ------------------------------------------------------------

dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    .groups = "drop"
  ) |>
  arrange(tipo_concreto)


# ------------------------------------------------------------
# QUESTÃO 26
# Várias estatísticas por tipo
# ------------------------------------------------------------

dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    n = sum(!is.na(resistencia_mpa)),
    
    media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    mediana =
      median(resistencia_mpa, na.rm = TRUE),
    
    desvio_padrao =
      sd(resistencia_mpa, na.rm = TRUE),
    
    minimo =
      min(resistencia_mpa, na.rm = TRUE),
    
    maximo =
      max(resistencia_mpa, na.rm = TRUE),
    
    .groups = "drop"
  )


# ============================================================
# ETAPA 7 — SELECIONANDO E REORGANIZANDO VARIÁVEIS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 27
# Seleção das variáveis quantitativas
# ------------------------------------------------------------

dados_quantitativos <- dados_limpos |>
  select(
    where(is.numeric)
  )

dados_quantitativos


# Podemos excluir variáveis auxiliares, caso desejado

dados_quantitativos <- dados_limpos |>
  select(
    idade_dias,
    resistencia_mpa,
    cimento_kg_m3,
    relacao_a_c,
    abatimento_mm,
    densidade_kg_m3,
    `absorção_agregado_pct`
  )

dados_quantitativos


# ------------------------------------------------------------
# QUESTÃO 28
# Média utilizando across()
# ------------------------------------------------------------

dados_quantitativos |>
  summarise(
    across(
      everything(),
      ~ mean(.x, na.rm = TRUE)
    )
  )


# ------------------------------------------------------------
# QUESTÃO 29
# Transformação simultânea com across()
# ------------------------------------------------------------

# Exemplo: padronização das variáveis quantitativas
#
# A transformação abaixo produz valores padronizados:
#
# (x - média) / desvio-padrão

dados_padronizados <- dados_limpos |>
  mutate(
    across(
      c(
        idade_dias,
        resistencia_mpa,
        cimento_kg_m3,
        relacao_a_c,
        abatimento_mm,
        densidade_kg_m3,
        `absorção_agregado_pct`
      ),
      ~ as.numeric(scale(.x))
    )
  )

dados_padronizados


# ------------------------------------------------------------
# QUESTÃO 30
# Estatísticas por grupo usando across()
# ------------------------------------------------------------

dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    across(
      c(
        resistencia_mpa,
        cimento_kg_m3,
        relacao_a_c,
        abatimento_mm,
        densidade_kg_m3
      ),
      list(
        media = ~ mean(.x, na.rm = TRUE),
        desvio = ~ sd(.x, na.rm = TRUE)
      ),
      .names = "{.col}_{.fn}"
    ),
    .groups = "drop"
  )


# ============================================================
# ETAPA 8 — TEXTOS E CATEGORIAS
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 31
# Padronização de obra
# ------------------------------------------------------------

# Situação antes
dados |>
  count(obra)

# Situação depois
dados_limpos |>
  count(obra)

# Exemplo de transformação explícita
dados |>
  mutate(
    obra = obra |>
      str_trim() |>
      str_to_upper()
  ) |>
  count(obra)


# ------------------------------------------------------------
# QUESTÃO 32
# Pesquisa utilizando padrões de texto
# ------------------------------------------------------------

# Localizar obras contendo a letra C
dados_limpos |>
  filter(
    str_detect(obra, "C")
  )

# Localizar tipos contendo "30"
dados_limpos |>
  filter(
    str_detect(tipo_concreto, "30")
  )

# Verificar se o tipo começa com C
dados_limpos |>
  filter(
    str_detect(tipo_concreto, "^C")
  )


# ============================================================
# ETAPA 9 — VISUALIZAÇÃO
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 33
# Boxplot da resistência por tipo
# ------------------------------------------------------------

ggplot(
  dados_limpos,
  aes(
    x = tipo_concreto,
    y = resistencia_mpa
  )
) +
  geom_boxplot(
    na.rm = TRUE
  ) +
  labs(
    title = "Distribuição da resistência por tipo de concreto",
    x = "Tipo de concreto",
    y = "Resistência à compressão (MPa)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# QUESTÃO 34
# Consumo de cimento × resistência
# ------------------------------------------------------------

ggplot(
  dados_limpos,
  aes(
    x = cimento_kg_m3,
    y = resistencia_mpa
  )
) +
  geom_point(
    na.rm = TRUE
  ) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    na.rm = TRUE
  ) +
  labs(
    title = "Relação entre consumo de cimento e resistência",
    x = "Consumo de cimento (kg/m³)",
    y = "Resistência à compressão (MPa)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# QUESTÃO 35
# Relação água/cimento × resistência
# ------------------------------------------------------------

ggplot(
  dados_limpos,
  aes(
    x = relacao_a_c,
    y = resistencia_mpa
  )
) +
  geom_point(
    na.rm = TRUE
  ) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    na.rm = TRUE
  ) +
  labs(
    title = "Relação entre água/cimento e resistência",
    x = "Relação água/cimento",
    y = "Resistência à compressão (MPa)"
  ) +
  theme_minimal()


# ============================================================
# ETAPA 10 — PRÁTICA PROFISSIONAL
# ============================================================


# ------------------------------------------------------------
# QUESTÃO 36
# O Bloco C apresenta desempenho superior?
# ------------------------------------------------------------

# Comparação numérica
comparacao_obras <- dados_limpos |>
  group_by(obra) |>
  summarise(
    n = sum(!is.na(resistencia_mpa)),
    
    media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    mediana =
      median(resistencia_mpa, na.rm = TRUE),
    
    desvio_padrao =
      sd(resistencia_mpa, na.rm = TRUE),
    
    .groups = "drop"
  ) |>
  arrange(desc(media))

comparacao_obras


# Comparação gráfica

ggplot(
  dados_limpos,
  aes(
    x = obra,
    y = resistencia_mpa
  )
) +
  geom_boxplot(
    na.rm = TRUE
  ) +
  labs(
    title = "Resistência à compressão por bloco da obra",
    x = "Obra",
    y = "Resistência (MPa)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# QUESTÃO 37
# Idade × resistência
# ------------------------------------------------------------

resistencia_idade <- dados_limpos |>
  group_by(idade_dias) |>
  summarise(
    n = sum(!is.na(resistencia_mpa)),
    
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    .groups = "drop"
  ) |>
  arrange(idade_dias)

resistencia_idade


# Gráfico

ggplot(
  resistencia_idade,
  aes(
    x = idade_dias,
    y = resistencia_media
  )
) +
  geom_point() +
  geom_line() +
  labs(
    title = "Resistência média em função da idade",
    x = "Idade do corpo de prova (dias)",
    y = "Resistência média (MPa)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# QUESTÃO 38
# Tabela-resumo para o engenheiro
# ------------------------------------------------------------

relatorio_resumo <- dados_limpos |>
  summarise(
    n_corpos_prova =
      n(),
    
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    resistencia_mediana =
      median(resistencia_mpa, na.rm = TRUE),
    
    resistencia_desvio_padrao =
      sd(resistencia_mpa, na.rm = TRUE),
    
    resistencia_minima =
      min(resistencia_mpa, na.rm = TRUE),
    
    resistencia_maxima =
      max(resistencia_mpa, na.rm = TRUE),
    
    cimento_medio =
      mean(cimento_kg_m3, na.rm = TRUE),
    
    relacao_ac_media =
      mean(relacao_a_c, na.rm = TRUE),
    
    abatimento_medio =
      mean(abatimento_mm, na.rm = TRUE),
    
    densidade_media =
      mean(densidade_kg_m3, na.rm = TRUE)
  )

relatorio_resumo


# ============================================================
# DESAFIO FINAL
# ============================================================

# O desafio consiste em reunir as principais operações
# realizadas nas questões anteriores em um único fluxo.


# ------------------------------------------------------------
# 1. INSPEÇÃO
# ------------------------------------------------------------

glimpse(dados)

dados |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )


# ------------------------------------------------------------
# 2. LIMPEZA
# ------------------------------------------------------------

dados_limpos <- dados |>
  
  mutate(
    # Padronização dos textos
    obra =
      obra |>
      str_trim() |>
      str_to_upper(),
    
    tipo_concreto =
      tipo_concreto |>
      str_trim() |>
      str_to_upper()
  ) |>
  
  mutate(
    # Conversão dos dados quantitativos
    resistencia_mpa =
      resistencia_mpa |>
      as.character() |>
      str_replace_all(",", ".") |>
      str_replace_all("[^0-9.-]", "") |>
      as.numeric(),
    
    idade_dias =
      as.numeric(idade_dias),
    
    cimento_kg_m3 =
      as.numeric(cimento_kg_m3),
    
    relacao_a_c =
      as.numeric(relacao_a_c),
    
    abatimento_mm =
      as.numeric(abatimento_mm),
    
    densidade_kg_m3 =
      as.numeric(densidade_kg_m3),
    
    `absorção_agregado_pct` =
      `absorção_agregado_pct` |>
      as.character() |>
      str_replace_all(",", ".") |>
      as.numeric()
  )


# ------------------------------------------------------------
# 3. IDENTIFICAÇÃO DE VALORES SUSPEITOS
# ------------------------------------------------------------

dados_suspeitos <- dados_limpos |>
  filter(
    idade_dias <= 0 |
      idade_dias > 365 |
      resistencia_mpa < 10 |
      resistencia_mpa > 100 |
      abatimento_mm < 0 |
      abatimento_mm > 300 |
      densidade_kg_m3 < 1800 |
      densidade_kg_m3 > 2600 |
      relacao_a_c < 0.20 |
      relacao_a_c > 1 |
      `absorção_agregado_pct` < 0 |
      `absorção_agregado_pct` > 20
  )

dados_suspeitos


# ------------------------------------------------------------
# 4. VARIÁVEIS DERIVADAS
# ------------------------------------------------------------

dados_limpos <- dados_limpos |>
  
  mutate(
    resistencia_referencia =
      case_when(
        tipo_concreto == "C25" ~ 25,
        tipo_concreto == "C30" ~ 30,
        tipo_concreto == "C35" ~ 35,
        tipo_concreto == "C40" ~ 40,
        TRUE ~ NA_real_
      )
  ) |>
  
  mutate(
    resistencia_relativa =
      resistencia_mpa /
      resistencia_referencia
  ) |>
  
  mutate(
    classificacao =
      case_when(
        resistencia_relativa >= 1 ~
          "Atende ou supera",
        
        resistencia_relativa >= 0.90 ~
          "Próximo da referência",
        
        resistencia_relativa < 0.90 ~
          "Abaixo da referência",
        
        TRUE ~ NA_character_
      )
  )


# ------------------------------------------------------------
# 5. MÉDIAS POR TIPO
# ------------------------------------------------------------

resumo_tipo <- dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    n = sum(!is.na(resistencia_mpa)),
    
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    desvio_padrao =
      sd(resistencia_mpa, na.rm = TRUE),
    
    cimento_medio =
      mean(cimento_kg_m3, na.rm = TRUE),
    
    relacao_ac_media =
      mean(relacao_a_c, na.rm = TRUE),
    
    abatimento_medio =
      mean(abatimento_mm, na.rm = TRUE),
    
    densidade_media =
      mean(densidade_kg_m3, na.rm = TRUE),
    
    .groups = "drop"
  )

resumo_tipo


# ------------------------------------------------------------
# 6. RESUMO POR OBRA
# ------------------------------------------------------------

resumo_obra <- dados_limpos |>
  group_by(obra) |>
  summarise(
    n = n(),
    
    resistencia_media =
      mean(resistencia_mpa, na.rm = TRUE),
    
    mediana =
      median(resistencia_mpa, na.rm = TRUE),
    
    desvio_padrao =
      sd(resistencia_mpa, na.rm = TRUE),
    
    .groups = "drop"
  ) |>
  arrange(desc(resistencia_media))

resumo_obra


# ------------------------------------------------------------
# 7. GRÁFICOS
# ------------------------------------------------------------

# Resistência por tipo
ggplot(
  dados_limpos,
  aes(
    x = tipo_concreto,
    y = resistencia_mpa
  )
) +
  geom_boxplot(na.rm = TRUE) +
  labs(
    title = "Resistência por tipo de concreto",
    x = "Tipo de concreto",
    y = "Resistência (MPa)"
  ) +
  theme_minimal()


# Cimento × resistência
ggplot(
  dados_limpos,
  aes(
    x = cimento_kg_m3,
    y = resistencia_mpa
  )
) +
  geom_point(na.rm = TRUE) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    na.rm = TRUE
  ) +
  labs(
    title = "Consumo de cimento × resistência",
    x = "Cimento (kg/m³)",
    y = "Resistência (MPa)"
  ) +
  theme_minimal()


# Água/cimento × resistência
ggplot(
  dados_limpos,
  aes(
    x = relacao_a_c,
    y = resistencia_mpa
  )
) +
  geom_point(na.rm = TRUE) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    na.rm = TRUE
  ) +
  labs(
    title = "Relação água/cimento × resistência",
    x = "Relação água/cimento",
    y = "Resistência (MPa)"
  ) +
  theme_minimal()


# ============================================================
# REFLEXÃO FINAL
# ============================================================

# A resposta esperada deve destacar que:
#
# - dados incorretos podem produzir estatísticas incorretas;
# - valores ausentes precisam ser identificados;
# - categorias inconsistentes dificultam agrupamentos;
# - erros de escala podem produzir resultados absurdos;
# - tipos inadequados dificultam cálculos;
# - decisões de limpeza precisam ser documentadas;
# - a análise estatística depende da qualidade dos dados.
#
# No contexto da Engenharia Civil, uma base mal processada
# pode levar a conclusões equivocadas sobre resistência,
# qualidade do concreto e desempenho da obra.


# ============================================================
# VERIFICAÇÃO FINAL DA BASE
# ============================================================

glimpse(dados_limpos)

dados_limpos |>
  summary()

dados_limpos |>
  summarise(
    total_observacoes = n(),
    total_variaveis = ncol(pick(everything())),
    total_NA = sum(is.na(pick(everything())))
  )