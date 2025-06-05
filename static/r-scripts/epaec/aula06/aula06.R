# Universidade Federal de São João del-Rei
# Departamento de Estatística, Física e Matemática (DEFIM)
# Prof. Ben Dêivide (http://bendeivide.github.io)
# Aula 06: Medidas de posição


# Pre-requisitos  
install.packages("devtools")
devtools::install_github("bendeivide/leem")
library(leem)

# Conjunto de dados iniciais
## Dados elaborados sobre o número de erros encontrados em 
## 20 conjunto de caracteres monitorado em um canal de comunicação
d1 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/nerros.txt",
                 h = T); d1 <- d1$erros

## Os dados representam a temperatura (ºF) do anel de vedação de 
## cada teste de acionamento ou lançamento real do motor do 
# foguete Challenger
d2 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/challenger.txt",
                 h = T); d2 <- d2$chal



# Inserindo as medidas nos graficos

# Grafico de hastes ou bastao

d1 |> new_leem(variable = 1) |> 
  tabfreq() |> 
  stickplot(lcol = "red", pcol = "red") |> 
  insert(parrow = 1, larrow  = 0.2, side = "right") |>
  insert(type = "median", side = "left", lcol = "blue",
         lwd = 2)