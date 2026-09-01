################################################################
# LISTA DE RELATORIO 03
# DISCIPLINA: EAIT
# MESTRADO PROFISSIONAL EM TECNOLOGIAS E INOVACOES CONSTRUTIVAS
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/eait
################################################################


# 1. Importação ------------------------------------------------

# Importação inicial da base de dados.
#
# Nesta etapa, a base ainda não deve ser modificada.

dados <- read.csv2(
  "base_processamento_dados_engenharia_civil.csv",
  stringsAsFactors = FALSE,
  check.names = FALSE
)


# Carregamento da família tidyverse.
#
# O tidyverse reúne diversos pacotes voltados para:
#
# - manipulação de dados;
# - transformação;
# - importação;
# - organização;
# - visualização;
# - programação funcional.

library(tidyverse)


# Explore a estrutura da base.

glimpse(dados)


# Visualização dos nomes das variáveis.

names(dados)


# Visualização inicial dos dados.

head(dados)


# Dimensões da base.

dim(dados)


# ------------------------------------------------------------
# 2. Diagnóstico dos dados
# ------------------------------------------------------------

# Investigue a qualidade da base utilizando funções do
# tidyverse.

# Verifique:
#
# - tipos das variáveis;
# - valores ausentes;
# - categorias;
# - erros de digitação;
# - espaços extras;
# - valores potencialmente incompatíveis;
# - problemas de representação numérica.


# Quantidade de valores ausentes por variável:

dados |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )


# Frequência das categorias da variável obra:

dados |>
  count(obra)


# Frequência das categorias de tipo_concreto:

dados |>
  count(tipo_concreto)


# Verificação de espaços extras:

dados |>
  filter(
    obra != str_trim(obra)
  )


# Padronização conceitual das categorias:

dados |>
  distinct(
    obra,
    tipo_concreto
  )


# ------------------------------------------------------------
# 3. Processamento dos dados
# ------------------------------------------------------------

# A partir desta etapa, NÃO utilize as funções da Base R
# estudadas anteriormente como solução principal.
#
# Utilize prioritariamente funções da família tidyverse.


# Algumas funções que podem ser utilizadas:
#
# dplyr
#   select()
#   filter()
#   mutate()
#   rename()
#   arrange()
#   summarise()
#   group_by()
#   count()
#   distinct()
#   across()
#   case_when()
#   if_else()
#
# tidyr
#   drop_na()
#   replace_na()
#   pivot_longer()
#   pivot_wider()
#   separate()
#   unite()
#
# stringr
#   str_trim()
#   str_to_upper()
#   str_to_lower()
#   str_replace()
#   str_replace_all()
#   str_detect()
#   str_sub()
#
# purrr
#   map()
#   map_dbl()
#   map_chr()
#   map_lgl()
#
# readr
#   parse_number()
#   parse_double()
#   parse_integer()
#
# ggplot2
#   ggplot()
#   geom_histogram()
#   geom_boxplot()
#   geom_point()
#   geom_bar()
#   geom_col()


# ------------------------------------------------------------
# 4. Limpeza dos dados
# ------------------------------------------------------------

# NÃO altere o objeto dados.
#
# Crie uma nova versão para o processamento.

dados_limpos <- dados


# Padronização das variáveis de texto:

dados_limpos <-
  dados_limpos |>
  mutate(
    obra = str_trim(obra),
    tipo_concreto = str_to_upper(
      str_trim(tipo_concreto)
    )
  )


# Verifique se as categorias foram padronizadas:

dados_limpos |>
  count(obra)


dados_limpos |>
  count(tipo_concreto)


# ------------------------------------------------------------
# 5. Conversão das variáveis numéricas
# ------------------------------------------------------------

# Algumas variáveis podem ter sido importadas como texto em
# razão dos erros de digitação ou representação decimal.
#
# Utilize funções do tidyverse para realizar as conversões.


# Exemplo de substituição de caracteres:

dados_limpos <-
  dados_limpos |>
  mutate(
    resistencia_mpa =
      str_replace_all(
        resistencia_mpa,
        ",",
        "."
      )
  )


# Correção de caracteres que representam erros de digitação:

dados_limpos <-
  dados_limpos |>
  mutate(
    resistencia_mpa =
      str_replace_all(
        resistencia_mpa,
        "O",
        "0"
      )
  )


# Conversão para número:

dados_limpos <-
  dados_limpos |>
  mutate(
    resistencia_mpa =
      parse_double(resistencia_mpa)
  )


# Faça procedimento equivalente para as demais variáveis que
# necessitarem de tratamento.


# ------------------------------------------------------------
# 6. Identificação de valores ausentes
# ------------------------------------------------------------

# Quantidade de NA por variável:

dados_limpos |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )


# Percentual de valores ausentes:

dados_limpos |>
  summarise(
    across(
      everything(),
      ~ mean(is.na(.x)) * 100
    )
  )


# ------------------------------------------------------------
# 7. Investigação de valores incompatíveis
# ------------------------------------------------------------

# Utilize filter() para localizar observações suspeitas.

# Exemplo:

dados_limpos |>
  filter(
    abatimento_mm > 500
  )


# Outro exemplo:

dados_limpos |>
  filter(
    densidade_kg_m3 < 1000
  )


# IMPORTANTE:
#
# Um valor potencialmente incompatível não deve ser
# automaticamente excluído ou corrigido.
#
# A decisão deve ser justificada pelo contexto da Engenharia
# Civil e, quando possível, pela consulta à fonte original.


# ------------------------------------------------------------
# 8. Correção de valores
# ------------------------------------------------------------

# Quando houver evidência suficiente para realizar uma
# correção, utilize mutate() com if_else() ou case_when().


# Exemplo:

dados_limpos <-
  dados_limpos |>
  mutate(
    abatimento_mm =
      if_else(
        abatimento_mm == 1250,
        125,
        abatimento_mm
      )
  )


# Para múltiplas condições, utilize case_when():

dados_limpos <-
  dados_limpos |>
  mutate(
    densidade_kg_m3 =
      case_when(
        densidade_kg_m3 == 238 ~ 2380,
        TRUE ~ densidade_kg_m3
      )
  )


# ------------------------------------------------------------
# 9. Criação de novas variáveis
# ------------------------------------------------------------

# Utilize mutate() para criar novas variáveis.


# Exemplo de classificação:

dados_limpos <-
  dados_limpos |>
  mutate(
    classificacao =
      case_when(
        resistencia_mpa >= 40 ~ "Alta",
        resistencia_mpa >= 30 ~ "Intermediária",
        TRUE ~ "Baixa"
      )
  )


# ------------------------------------------------------------
# 10. Agrupamento
# ------------------------------------------------------------

# group_by() permite realizar operações separadamente
# dentro de cada grupo.


# Resistência média por tipo de concreto:

dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    resistencia_media =
      mean(
        resistencia_mpa,
        na.rm = TRUE
      )
  )


# Resistência média por obra:

dados_limpos |>
  group_by(obra) |>
  summarise(
    resistencia_media =
      mean(
        resistencia_mpa,
        na.rm = TRUE
      )
  )


# Agrupamento por duas variáveis:

dados_limpos |>
  group_by(
    obra,
    tipo_concreto
  ) |>
  summarise(
    resistencia_media =
      mean(
        resistencia_mpa,
        na.rm = TRUE
      ),
    n = n(),
    .groups = "drop"
  )


# ------------------------------------------------------------
# 11. Estatísticas descritivas
# ------------------------------------------------------------

# Calcule diferentes medidas utilizando summarise().

dados_limpos |>
  summarise(
    n = sum(
      !is.na(resistencia_mpa)
    ),
    
    media =
      mean(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    mediana =
      median(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    desvio_padrao =
      sd(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    minimo =
      min(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    maximo =
      max(
        resistencia_mpa,
        na.rm = TRUE
      )
  )


# ------------------------------------------------------------
# 12. Estatísticas por grupo
# ------------------------------------------------------------

# Exemplo: resumo completo por tipo de concreto.

dados_limpos |>
  group_by(tipo_concreto) |>
  summarise(
    
    n =
      sum(
        !is.na(resistencia_mpa)
      ),
    
    media =
      mean(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    mediana =
      median(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    desvio_padrao =
      sd(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    minimo =
      min(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    maximo =
      max(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    .groups = "drop"
  )


# ------------------------------------------------------------
# 13. Criação de variáveis relativas ao grupo
# ------------------------------------------------------------

# Exemplo:
#
# Comparar a resistência de cada corpo de prova com a média
# do seu respectivo tipo de concreto.


dados_limpos <-
  dados_limpos |>
  group_by(tipo_concreto) |>
  mutate(
    media_tipo =
      mean(
        resistencia_mpa,
        na.rm = TRUE
      ),
    
    acima_media =
      resistencia_mpa >
      media_tipo
  ) |>
  ungroup()


# Verifique o resultado:

dados_limpos |>
  select(
    id_corpo_prova,
    tipo_concreto,
    resistencia_mpa,
    media_tipo,
    acima_media
  )


# ------------------------------------------------------------
# 14. Uso de across()
# ------------------------------------------------------------

# across() permite aplicar uma função a várias colunas.


dados_limpos |>
  summarise(
    across(
      where(is.numeric),
      ~ mean(
        .x,
        na.rm = TRUE
      )
    )
  )


# Desvio-padrão das variáveis numéricas:

dados_limpos |>
  summarise(
    across(
      where(is.numeric),
      ~ sd(
        .x,
        na.rm = TRUE
      )
    )
  )


# ------------------------------------------------------------
# 15. Uso de purrr
# ------------------------------------------------------------

# A família purrr oferece ferramentas para programação
# funcional dentro do tidyverse.


# Exemplo:

dados_limpos |>
  select(
    where(is.numeric)
  ) |>
  map_dbl(
    ~ mean(
      .x,
      na.rm = TRUE
    )
  )


# O resultado é um vetor numérico contendo a média de cada
# variável quantitativa.


# ------------------------------------------------------------
# 16. Visualização
# ------------------------------------------------------------

# A família tidyverse também inclui o ggplot2.


# Histograma da resistência:

ggplot(
  dados_limpos,
  aes(
    x = resistencia_mpa
  )
) +
  geom_histogram(
    bins = 15
  )


# Boxplot da resistência por tipo:

ggplot(
  dados_limpos,
  aes(
    x = tipo_concreto,
    y = resistencia_mpa
  )
) +
  geom_boxplot()


# Resistência por idade:

ggplot(
  dados_limpos,
  aes(
    x = idade_dias,
    y = resistencia_mpa
  )
) +
  geom_point()


# Relação água/cimento e resistência:

ggplot(
  dados_limpos,
  aes(
    x = relacao_a_c,
    y = resistencia_mpa
  )
) +
  geom_point()


# ------------------------------------------------------------
# 17. Verificação final
# ------------------------------------------------------------

# Estrutura:

glimpse(dados_limpos)


# Número de linhas e colunas:

dim(dados_limpos)


# Valores ausentes:

dados_limpos |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )


# Categorias:

dados_limpos |>
  count(obra)


dados_limpos |>
  count(tipo_concreto)


# Resumo final:

summary(dados_limpos)


# ============================================================
# 18. DESAFIO
# ============================================================

# Refaça as 35 questões da atividade utilizando,
# prioritariamente, as ferramentas da família tidyverse.
#
# NÃO utilize como solução principal:
#
# subset()
# apply()
# lapply()
# sapply()
# ifelse()
# for
# if
# tapply()
# aggregate()
# split()
# with()
# by()
# within()
# ave()
#
# Procure substituir essas estruturas por ferramentas como:
#
# filter()
# select()
# mutate()
# summarise()
# group_by()
# count()
# across()
# if_else()
# case_when()
# map()
# map_dbl()
# pivot_longer()
# pivot_wider()
#
# O objetivo não é apenas obter o mesmo resultado.
#
# O aluno deverá compreender como a lógica do processamento
# muda quando utilizamos o paradigma de manipulação de dados
# adotado pelo tidyverse.


# ============================================================
# 19. PRODUTO FINAL
# ============================================================

# Ao final da atividade, apresente:
#
# 1. Uma versão limpa da base;
#
# 2. O registro dos problemas encontrados;
#
# 3. A justificativa para cada decisão de tratamento;
#
# 4. As respostas das 35 questões;
#
# 5. Os códigos utilizados;
#
# 6. Tabelas e/ou gráficos que auxiliem a interpretação;
#
# 7. Uma breve conclusão sobre a qualidade dos dados;
#
# 8. Uma reflexão sobre as diferenças entre o processamento
#    realizado anteriormente com Base R e o processamento
#    realizado agora com tidyverse.


# ============================================================
# REFLEXÃO FINAL
# ============================================================

# Perguntas para reflexão:
#
# 1. Qual solução ficou mais legível: Base R ou tidyverse?
#
# 2. Qual solução foi mais fácil de organizar em etapas?
#
# 3. Como group_by() + summarise() se relaciona com
#    tapply() e aggregate()?
#
# 4. Como mutate() se relaciona com a criação de novas
#    variáveis realizada anteriormente?
#
# 5. Qual é a vantagem de utilizar o operador |>?
#
# 6. Em quais situações purrr pode ser útil?
#
# 7. O uso de tidyverse elimina a necessidade de compreender
#    a estrutura dos dados?
#
# 8. Uma ferramenta mais simples de programação garante,
#    sozinha, uma análise estatística correta?
#
# 9. Quais decisões realizadas durante a limpeza dependem
#    do conhecimento do engenheiro?
#
# 10. Por que a etapa de diagnóstico deve ocorrer antes
#     da análise estatística?