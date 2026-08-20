#######################################################
# AULA 03 - COLETA, ORGANIZACAO E APRESENTACAO DE DADOS
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
#######################################################

# Instalando o leem via CRAN
install.packages("leem")

# Instalar o leem via (Github)
pkgs <- c("manipulate", "tkRplotR", "tkrplot", "crayon", "diagram")
install.packages(pkgs)
# install.packages("devtools")
devtools::install_github("bendeivide/leem")

# Carregando o leem
library(leem)

# Dados
set.seed(10)
dados <- round(rnorm(40, 100, 2), 2)
# Usando o leem
dados |>
  new_leem(variable = 2) |>
  tabfreq(k = 5) |>
  hist() |>
  insert()
