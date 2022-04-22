# Universidade Federal de São João del-Rei
# Departamento de Estatística, Física e Matemática (DEFIM)
# Prof. Ben Dêivide (http://bendeivide.github.io)
# Aula 04: Coleta, organização e apresentação de dados


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

# Dados 

## Dados em rol

sort(d1)
sort(d2)

# Distribuicao de frequencias

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

## Grafico de hastes ou bastao
### Forma convencional:
aux1 <- new_leem(d1, variable = "discrete")
aux2 <- tabfreq(aux1)
stickplot(aux2, 
          lwd=3, # largura da linha
          pcol = "red", # cor da linha
          bgcol = "lightgray", # cor do fundo
          panel.first = grid(col = "white") # inserindo grid e sua cor
)
### Usando pipe:
d1 |> 
  new_leem(variable = "discrete") |> 
  tabfreq() |> 
  stickplot(lwd=3, # largura da linha
            pcol = "red", # cor da linha
            bgcol = "lightgray", # cor do fundo
            panel.first = grid(col = "white") # inserindo grid e sua cor
            )

## Grafico de barras
### Forma convencional:
aux1 <- new_leem(d1, variable = 1)
aux2 <- tabfreq(aux1)
barplot(aux2, barcol = heat.colors(5))
###  Usando o pipe
d1 |> 
  new_leem(variable = 1) |> 
    tabfreq() |> 
      barplot(barcol = heat.colors(5))

## Histograma de frequencias

d2 |> 
  new_leem(variable = 2) |> 
    tabfreq() |> 
      hist(barcol = heat.colors(6))

## Poligono

### Dados discretos
d1 |> 
  new_leem(variable = 1) |> 
    tabfreq() |> 
      polyfreq(barcol = heat.colors(5),
           main = "Polígono de frequências e
Histograma de frequências")

### Dados continuos
d2 |> 
  new_leem(variable = 2) |> 
    tabfreq() |> 
      polyfreq(barcol = heat.colors(5),
           main = "Polígono de frequências e
Histograma de frequências")

### Sem barras

d2 |> 
  new_leem(variable = 2) |> 
    tabfreq() |> 
      polyfreq(bars = FALSE)


## Ogivas

### Dados discretos

#### Crescente

d1 |> 
  new_leem(variable = 1) |> 
    tabfreq() |> 
      ogive(bars = TRUE, barcol = "red")

#### Decrescente

d1 |> 
  new_leem(variable = 1) |> 
   tabfreq() |> 
    ogive(decreasing = TRUE, 
        bars = TRUE, barcol = "yellow")

#### Ambos

d1 |> 
  new_leem(variable = 1) |> 
  tabfreq() |> 
  ogive(both = TRUE, # ambas ogivas 
        bars = TRUE, # barras
        barcol = c("red", "yellow"))


### Dados continuos

#### Crescente

d2 |> 
  new_leem(variable = 2) |> 
  tabfreq() |> 
  ogive(bars = TRUE, barcol = "red")

#### Decrescente

d2 |> 
  new_leem(variable = 2) |> 
  tabfreq() |> 
  ogive(decreasing = TRUE, 
        bars = TRUE, barcol = "yellow")

#### Ambos

d2 |> 
  new_leem(variable = 2) |> 
  tabfreq() |> 
  ogive(both = TRUE, # ambas ogivas 
        bars = TRUE, # barras
        barcol = c("red", "yellow"))

#### Ambos e histograma

d2 |> 
  new_leem(variable = 2) |> 
  tabfreq() |> 
  ogive(both = TRUE, # ambas ogivas 
        bars = TRUE, # barras
        barcol = c("red", "yellow"), # cor da barra das duas ogivas
        histogram = TRUE, # incluindo o histograma
        histcol = gray.colors(6), # cor do histograma
        bgcol = "purple") # cor do fundo


