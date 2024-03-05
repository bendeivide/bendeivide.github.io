###############################################################
# AULA 02 - EXERCICIOS SOBRE DEFINICOES GERAIS DA ESTATISTICA
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
###############################################################

# Anexando o leem
library(leem)

# Numero de cidades da amazonia legal
## Primeira forma
ncid <- c(144, 141, 52, 62, 181, 22, 139, 15, 14)
ncid |>
  new_leem(variable = 1) # ou new_leem(variable = "discrete")
## Segunda forma
ncid <- c(144, 141, 52, 62, 181, 22, 139, 15, 14)
ncidleem <- new_leem(ncid, variable = 1) # ou new_leem(variable = "discrete")
ncidleem
# Classe do objeto
class(ncidleem)

# Area total
## Primeira forma
atot <- c(1245870, 903207.02, 237765.20, 1559167.89,
          276419.84, 164123.96, 277466.76, 223644.53, 142470.76)
atot |>
  new_leem(variable = 2) # ou new_leem(variable = "continuous")
## Segunda forma
atot <- c(1245870, 903207.02, 237765.20, 1559167.89,
          276419.84, 164123.96, 277466.76, 223644.53, 142470.76)
atotleem <- new_leem(atot, variable = 2) # ou new_leem(variable = "discrete")
atotleem
# Classe do objeto
class(atotleem)

