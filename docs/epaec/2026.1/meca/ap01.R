# Pacotes necessarios
library(leem)

# Importacao de dados
ap01 <- read.csv2("/media/ben10/Backup/BEN_UFSJ/2026.1/Exp_catapulta/aula01/meca/ap01.csv")
# Dados brutos
dbrutos <- ap01$dist
# Dados elaborados
drol <- sort(dbrutos)
# Tabular os dados
## Fase 01
aux <- new_leem(x = drol,
                variable = 2)
## Fase 02
tab <- tabfreq(aux, k = 3)
## Forma alternativa (Mais rapido)
drol |>
  new_leem(variable = 2) |>
  tabfreq(k = 3) |>
  barplot()

