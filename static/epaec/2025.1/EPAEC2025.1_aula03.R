########################################################
# AULA 03 - Coleta, organizacao e apresentacao de dados
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
# Período: 2025.1
########################################################

# Dados
set.seed(10)
dados <- round(rnorm(20, 165, 4), 0)

# Rol
sort(dados)

# Tabulacao
tabulacao <- dados |>
  new_leem(variable = 2) |>
  tabfreq()
