# Organizacao de dados
library(readxl)
dist <- read_excel("Documentos/TRABALHO_TEMPORARIO/bendeivide.github.io(24.08.2026)/static/epaec/2026.2/dados/distancia_catapulta_24.08.26.xls")
# Dados de distancia
distancia <- dist$dist
# pacote leem
library(leem)
# Tabulacao
distancia |>
  new_leem(variable = 2)|>
  tabfreq()
# Histograma
distancia |>
  new_leem(variable = 2)|>
  tabfreq() |>
  polyfreq()

# Medidas
distancia |>
  new_leem(variable = 2)|>
  tabfreq() |>
  mpos()
