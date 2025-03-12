###########################################################################
# PALESTRA: O pacote leem para o ensino de estatística
# EVENTO: XVI Programa de Verão DES-ICET/UFLA - 2025
# DATA: 11/03/2025, 15:30
# LOCAL (YOUTUBE): https://www.youtube.com/@departamentodeestatisticau1017 
# MATERIAL DE APOIO: https://bendeivide.github.io/talk/pacote-leem-para-o-ensino-da-estatistica/
###########################################################################



# Anexando o leem
library(leem)


# Abrindo a interface do leem (Em desenvolvimento!)
leem()


# Importando dados
d1 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/refs/heads/master/dados/cap02/tabela2.1.txt", h = TRUE)
d1 <- d1$erros
d2 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/dados_exem2.1.txt", h = TRUE)
d2 <- d2$challenger

#####################
# Tabulacao dos dados
#####################

## VQ discreta
d1 |>
  new_leem() |>
  tabfreq()

## VQ continua
res <- d2 |>
  new_leem(variable = 2) |>
  tabfreq()

## Variavel qualitativa
### Exemplo 3 - funcao tabfreq()
### Exemplo 2 - funcao stickchart() 
school <- rep(c("high", "university", "basic"), 3:5)
sample(school, 30, TRUE) |>
  new_leem() |>
  tabfreq(ordered = c("basic", "high", "university"))
  


## Detalhar com a tabulacao foi realizada


##########
# Graficos
##########

# OBS.: Podemos mudar as frequencias
#       no eixo Y

# Grafico hastes ou bastao
#...

# Grafico de barras
#...

# Grafico de histograma
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist()

# Grafico de ogiva
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(freq = "p", decreasing = TRUE, bars = TRUE)

# Poligono de frequencia
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq()

# Grafico Boxplot
showboxplot()
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  boxplot(type = "classes")

# Grafico de pizza
#...

####################
# Medidas de posicao
####################

## Media
### Agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean()

### Nao agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean(grouped = FALSE)

## Mediana
### Agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median()
### Nao agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median(grouped = FALSE)

## Moda
### Agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq()
### Nao agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq(grouped = FALSE)

## 3 medidas juntas
### Agrupado
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mpos()
### Nao agrupado
#...

## Medidas representadas em graficos
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "all")

d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(both = TRUE) |>
  insert(type = "median")


######################
# Medidas de dispersao
######################

# Amplitude
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  amplitude()

# Modulo do desvio medio
# madev()

# Modulo do desvio mediano
# medev()

# Variancia
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  variance()

# Desvio padrao
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  sdev()

# Coeficiente de Variacao
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  cv()

# Erro padrao da media
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mstde()

######################
# Assimetria e Curtose
######################

## Assimetria (Mostrar)
showskew()
## Calcular
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  skewness()

## Curtose (Mostrar)
showkur()


################################
# Distribuicoes de Probabilidade
# Distribuicoes Amostrais
################################

# Propriedades da Funcao de distribuicao
showcdf(prop = 1) # prop = 1, 2, 3
showcdf(variable = "continuous" , prop = 3)


# VA Discreta
## Funcao de probabilidade (Qualquer)
x <- 1:5
p <- c(0.23, 0.27,0.30, 0.12, 0.08)
apf(x, p)
## Funcao de distribuicao (Qualquer)
x <- 1:5
fda <- c(0.23, 0.5, 0.8, 0.92, 1)
cdfd(x, fda)

## VAs discreta e continua (Funcao P())
P(-1 %>x>% 1, dist = "normal", mean = 0, sd = 1,
  lower.tail = FALSE)

## Funcao Quantil (Funcao Q())


## Propriedades da distribuicao normal
### type = 1, 2, 3, 4, 5
propofnormal(type = 5)

## Entendendo o computo de probabilidade
#   de uma distribuicao normal
probnormal(1, 2, type = 2)
probnormal(-1, 0, type = 3)
probnormal(-1, 0, type = 4)
probnormal(-1, 0, type = 5)
probnormal(-1, 2, type = 5)
probnormal(1, 2, type = 5)
probnormal(1, 2, type = 6)

## Entendendo como usar a tabela da
# distribuicao normal padrao
showtabnormal(1)


#####################
# Teoria da Estimacao
#####################
showci()


####################
# Teste de hipoteses
####################
# Null hypothesis
nullhyp <- h0 <- 90
# Simulation
set.seed(10)
data <- rnorm(30, 100, 10)
# Teste de hipóteses
th(data, h0 = h0, sd = 10)
# Representacao grafica
th(data, h0 = h0, sd = 10, plot = TRUE)








