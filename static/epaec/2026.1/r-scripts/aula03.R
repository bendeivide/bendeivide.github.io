########################################################
# AULA 03 - Coleta, organizacao e apresentacao de dados
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
########################################################

# Anexando o leem
library(leem)

# Importando dados
#-----------------
# Numero de erros
d1 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/tabela2.1.txt", h = TRUE)
(d1 <- d1$erros)
# Temperatura do foguete Challenger
d2 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/dados_exem2.1.txt", h = TRUE)
(d2 <- d2$chal)

# Dados em rol
sort(d1) # Num de erros
sort(d2) # Temperatura

# Distribuicao de frequencia
## Forma convencional:
aux <- new_leem(d1, 1)
tabd1 <- tabfreq(aux); tabd1
#-----
aux <- new_leem(d2, 2)
tabd2 <- tabfreq(aux); tabd2
## Usando o operador 'pipe' nativo
d1 |> new_leem(variable = 1) |> tabfreq()
d2 |> new_leem(variable = 2) |> tabfreq()

# Apresentacao grafica
## Graf Hastes
### Forma convencional:
aux1 <- new_leem(d1, variable = "discrete")
aux2 <- tabfreq(aux1)
stickchart(aux2,
           lwd=3, # largura da linha
           pcol = "red", # cor da linha
           bgcol = "lightgray", # cor do fundo
           panel.first = grid(col = "white") # inserindo grid e sua cor
)
### Usando o pipe
d1 |>
  new_leem(variable = "discrete") |>
  tabfreq() |>
  stickchart(lwd=3, # largura da linha
             pcol = "red", # cor da linha
             bgcol = "lightgray", # cor do fundo
             panel.first = grid(col = "white") # inserindo grid e sua cor
  )

## Graf de barras
### Forma convencional:
aux1 <- new_leem(d1, variable = 1)
aux2 <- tabfreq(aux1)
barplot(aux2, barcol = heat.colors(5))
### Usando o pipe
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  barplot(barcol = heat.colors(5))

## Histograma de freq
### Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist(barcol = heat.colors(6))

## Poligono de freq
### D. discretos
#### Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  polyfreq(barcol = heat.colors(5),
           main = "Polígono de frequências e
Histograma de frequências")
### D. continuos
#### Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq(barcol = heat.colors(5),
           main = "Polígono de frequências e
Histograma de frequências")

### Poligono sem barras
#### Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq(bars = FALSE)

### Ogivas
#### D discretos (Crescente)
##### Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  ogive(bars = TRUE, barcol = "red")
#### D discretos (Decrescente)
##### Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  ogive(decreasing = TRUE,
        bars = TRUE, barcol = "yellow")
#### Ambos
# Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  ogive(both = TRUE, # ambas ogivas
        bars = TRUE, # barras
        barcol = c("red", "yellow"))

#### D continuos (Crescente)
# Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(bars = TRUE, barcol = "red")
#### D continuos (Decrescente)
# Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(decreasing = TRUE,
        bars = TRUE, barcol = "yellow")
#### Ambos
# Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(both = TRUE, # ambas ogivas
        bars = TRUE, # barras
        barcol = c("red", "yellow"))
#### Ambos + Histograma
# Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(both = TRUE, # ambas ogivas
        bars = FALSE, # barras
        barcol = c("red", "yellow"), # cor da barra das duas ogivas
        histogram = TRUE, # incluindo o histograma
        histcol = gray.colors(6), # cor do histograma
        bgcol = "purple") # cor do fundo

### Grafico de Pizza
#### D discretos
##### Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  piechart()
#### D continuos
##### Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  piechart()