#######################################################
# AULA 03 - COLETA, ORGANIZACAO E APRESENTACAO DE DADOS
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
#######################################################

# Instalando pacotes necessarios
################################

## Opcao 1 (CRAN - Incompleto)
install.packages("leem")

## Opcao 2 (Via GitHub - Recomendado)
install.packages("devtools")
devtools::install_github("bendeivide/leem")


# Motivacao inicial
###################

## Dados (Primeiro tipo)
set.seed(10) # Semente
rnorm(1000, 100, 50) # Conj dados

## Dados (Segundo tipo)
set.seed(10) # Semente
sort(rnorm(1000, 100, 50)) # Ordenamento

## Dados (Terceiro tipo)
set.seed(10) # Semente
x <- leem::new_leem(rnorm(1000, 100, 50), # Dados
                    variable = "continuous")
leem::tabfreq(x) # Tabulacao

## Dados (Quarto tipo)
set.seed(10) # Semente
leem::new_leem(rnorm(1000, 100, 50), variable = "continuous") |> #Objeto
  tabfreq() |> # Tabulacao
  hist(main = "Histograma de frequências", # Histograma
       xlab = "Classes", ylab = "Frequência",
       barcol = heat.colors(15))

# Coleta (Dados brutos)
#######################

## Dados
dados <- c(3, 1, 0, 1, 3, 2, 4, 1, 3, 1, 
           1, 1, 2, 3, 3, 2, 0, 2, 0, 1)

## Ordenando
sort(dados)

# Exemplos
##########

## Exemplo 1
d1 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/nerros.txt", h = TRUE)
(d1 <- d1$erros)

## Exemplo 2
d2 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/challenger.txt",
                 h = T); 
(d2 <- d2$chal)

## Ordeando-os
sort(d1)
sort(d2)

## Distribuicao de frequencia
### Forma convencional:
aux <- new_leem(d1, 1)
tabd1 <- tabfreq(aux); tabd1
#-----
aux <- new_leem(d2, 2)
tabd2 <- tabfreq(aux); tabd2
### Usando o operador 'pipe' nativo
d1 |> new_leem(variable = 1) |> tabfreq()
d2 |> new_leem(variable = 2) |> tabfreq()

## Grafico

### Grafico de hastes ou bastao
#### Forma convencional:
aux1 <- new_leem(d1, variable = "discrete")
aux2 <- tabfreq(aux1)
stickchart(aux2,
           lwd=3, # largura da linha
           pcol = "red", # cor da linha
           bgcol = "lightgray", # cor do fundo
           panel.first = grid(col = "white") # inserindo grid e sua cor
)
#### Usando o pipe
d1 |>
  new_leem(variable = "discrete") |>
  tabfreq() |>
  stickchart(lwd=3, # largura da linha
             pcol = "red", # cor da linha
             bgcol = "lightgray", # cor do fundo
             panel.first = grid(col = "white") # inserindo grid e sua cor
  )

### Grafico de barras
#### Forma convencional:
aux1 <- new_leem(d1, variable = 1)
aux2 <- tabfreq(aux1)
barplot(aux2, barcol = heat.colors(5))
#### Usando o pipe
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  barplot(barcol = heat.colors(5))

### Histograma de frequencias
#### Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist(barcol = heat.colors(6))


### Poligono de frequencias
#### Dados discretos
##### Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  polyfreq(barcol = heat.colors(5),
           main = "Polígono de frequências e
Histograma de frequências")

#### Dados continuos
##### Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq(barcol = heat.colors(5),
           main = "Polígono de frequências e
Histograma de frequências")

#### Sem as barras
# Usando o pipe:
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq(bars = FALSE) # Sem barras


### Ogivas
#### Dados discretos (Crescente)
##### Usando o pipe:
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  ogive(bars = TRUE, barcol = "red")

#### Dados discretos (Decrescente)
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  ogive(decreasing = TRUE, # Descrescente
        bars = TRUE, barcol = "yellow")

#### Dados discretos (Ambos)
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  ogive(both = TRUE, # ambas ogivas
        bars = TRUE, # barras
        barcol = c("red", "yellow"))

#### Dados contínuos (Crescente)
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(bars = TRUE, barcol = "red")

#### Dados contínuos (Decrescente)
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(decreasing = TRUE,
        bars = TRUE, barcol = "yellow")

#### Dados contínuos (Ambos)
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(both = TRUE, # ambas ogivas
        bars = TRUE, # barras
        barcol = c("red", "yellow"))

#### Dados contínuos (Ambos + Histograma)
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(both = TRUE, # ambas ogivas
        bars = TRUE, # barras
        barcol = c("red", "yellow"), # cor da barra das duas ogivas
        histogram = TRUE, # incluindo o histograma
        histcol = gray.colors(6), # cor do histograma
        bgcol = "purple") # cor do fundo