# Dados
set.seed(10)
dados <- round(rnorm(20, mean = 100, sd = 1), 1)
# Ordenar
sort(dados)
# No leem
library(leem)
detalhe <- dados |>
  new_leem(variable = 2) |>
  tabfreq()
# Verificando passos do algoritmo
detalhe$statistics
# Verificando a tabulacao
detalhe$table
# Grafico
## Histograma
detalhe |>
  hist()
## Pizza
detalhe |>
  piechart()
## Ogiva
detalhe |>
  ogive(both = TRUE)
## Poligono
detalhe |>
  polyfreq()
## Hastes ou bastao  
#detalhe |>
#  stickchart()
