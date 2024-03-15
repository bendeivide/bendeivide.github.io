################################################
# AULA 06 - EXERCICIOS SOBRE MEDIDAS DE POSICAO
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
###############################################


# Carregando o leem
library(leem)

# Dados
dado <- c(13.8, 18.3, 32.2, 32.5)

# Media no leem
dado |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean(grouped = FALSE)

# Mediana no leem
dado |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median(grouped = FALSE)

# Moda no leem
dado |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq(grouped = FALSE)