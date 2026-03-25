######################################################################
# AULA 04 (AP02 - MECA) - COLETA, ORGANIZACAO E APRESENTACAO DE DADOS
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
######################################################################

# Pacotes utilizados
library(leem)


# Importacao de dados
## Lembre-se que o arquivo deve esta no diretorio de trabalho!!!!
ap02 <- read.csv2("https://raw.githubusercontent.com/bendeivide/bendeivide.github.io/refs/heads/main/docs/epaec/2026.1/meca/ap02-meca.csv")

# Trabalhando apenas com a variavel de interesse
dist <- ap02$dist # Dados brutos

# Dados elaborados (em rol)
sort(dist)

# Tabular os dados via leem
## Fase 01
aux <- new_leem(x = dist,
                variable = 2)
## Fase 02
tab <- tabfreq(aux, k = 3)
## Forma alternativa (Mais rapido)
dist |>
  new_leem(variable = 2) |>
  tabfreq(k = 3) 

