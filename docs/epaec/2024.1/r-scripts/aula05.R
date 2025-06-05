##############################################
# AULA 05 - MEDIDAS DE POSICAO
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
##############################################

# Anexando o leem
library(leem)

# Motivação sobre as medidas de posição
showpar()

# Exemplo 1: Dados do número de erros encontrados em 20 conjuntos 
# de caracteres monitorado em um canal de comunicação.
d1 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/tabela2.1.txt", h = TRUE)
(d1 <- d1$erros)


# Exemplo 2: Os dados representam a temperatura (°F) do anel de vedação 
# de cada teste de acionamento ou lançamento real do motor 
# do foguete Challenger
d2 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/dados_exem2.1.txt", h = TRUE)
(d2 <- d2$chal)


# Media
#------
# Nao execute; e' apenas um exemplo de estrutura de como usar
# o leem para calcular a media dos dados
#------
dado |> # Entrada dos dados
  new_leem() |> # Estruturando os dados a classe leem
  # Opções:
  #   new_leem(variable = 1) # => variável discreta
  #   new_leem(variable = 2) # => variável contínua
  tabfreq() |> # Distribuição de frequência
  mean() # Cálculo da média
# Opções:
#   mean(grouped = TRUE) # => Dados agrupados (Padrão)
#   mean(grouped = FALSE) # => Dados não agrupados

## Em acao!
##################
### Exemplo 1 - Com agrupamento
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mean()

### Exemplo 1 - Sem agrupamento
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mean(grouped = FALSE)

### Exemplo 2 - Com agrupamento
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean()

### Exemplo 2 - Sem agrupamento
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean(grouped = FALSE)


### Visualizando a media no histograma
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "mean", side = "left")

### Visualizando a media no grafico de barras
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  stickchart() |>
  insert(type = "mean", side = "left")


# Mediana
#--------
# Nao execute; e' apenas um exemplo de estrutura de como usar
# o leem para calcular a media dos dados
#------
dado |> # Entrada dos dados
  new_leem() |> # Estruturando os dados a classe leem
  # Opções:
  #   new_leem(variable = 1) # => variável discreta
  #   new_leem(variable = 2) # => variável contínua
  tabfreq() |> # Distribuição de frequência
  median() # Cálculo da mediana
# Opções:
#   median(grouped = TRUE) # => Dados agrupados (Padrão)
#   median(grouped = FALSE) # => Dados não agrupados

## Em acao!
##################
### Exemplo 1 - Com agrupamento
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  median()

### Exemplo 1 - Sem agrupamento
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  median(grouped = FALSE)

### Exemplo 2 - Com agrupamento
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median()

### Exemplo 2 - Sem agrupamento
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median(grouped = FALSE)


### Visualizando a mediana no histograma
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "median", side = "left")

### Visualizando a mediana no grafico de barras
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  stickchart() |>
  insert(type = "median", side = "left")


# Moda
#--------
# Nao execute; e' apenas um exemplo de estrutura de como usar
# o leem para calcular a media dos dados
#------
dado |> # Entrada dos dados
  new_leem() |> # Estruturando os dados a classe leem
  # Opções:
  #   new_leem(variable = 1) # => variável discreta
  #   new_leem(variable = 2) # => variável contínua
  tabfreq() |> # Distribuição de frequência
  mfreq() # Cálculo da moda
# Opções:
#   median(grouped = TRUE) # => Dados agrupados (Padrão)
#   median(grouped = FALSE) # => Dados não agrupados

## Em acao!
##################
### Exemplo 1 - Com agrupamento
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mfreq()

### Exemplo 1 - Sem agrupamento
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mfreq(grouped = FALSE)

### Exemplo 2 - Com agrupamento
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq()

### Exemplo 2 - Sem agrupamento
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq(grouped = FALSE)


### Visualizando a moda no histograma
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "mode", side = "left")

### Visualizando a moda no grafico de barras
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  stickchart() |>
  insert(type = "mode", # tipo de medida
         side = "right",  # lado onde a medida sera inserida
         parrow = 0.7, # altura onde a medida sera inserida
         larrow = 0.4, # largura onde a medida sera inserida
         lcol = "red") # cor da linha onde se encontra a medida

### Rearranjando classes e recalculando a moda
d2 |>
  new_leem(variable = 2) |>
  tabfreq(k = 5) # Apenas com 5 classes
##
d2 |>
  new_leem(variable = 2) |>
  tabfreq(k = 5) |>
  mfreq()

#####################################


# Inserindo as 3 medidas de posicao considerando 6 classes
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "all", larrow = 0.4, lcol = c("red", "blue", "black"))

# Inserindo as 3 medidas de posicao considerando 5 classes
d2 |>
  new_leem(variable = 2) |>
  tabfreq(k = 5) |>
  hist() |>
  insert(type = "all", larrow = 0.4, lcol = c("red", "blue", "black"))
  




