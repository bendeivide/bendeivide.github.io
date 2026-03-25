# Pacotes utilizados
library(leem)


# Importacao de dados
## Lembre-se que o arquivo deve esta no diretorio de trabalho!!!!
ap01 <- read.csv2("ap01.csv")

# Trabalhando apenas com a variavel de interesse
dist <- ap01$dist # Dados brutos

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

# Media, Mediana e moda
tab |> 
  mpos(grouped = FALSE)
##
tab |> 
  mean()

# Assimetria
tab |>
  hist() |>
  insert(type = "all")
