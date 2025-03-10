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
#...

## VQ continua
#...

## Variavel qualitativa
### Exemplo 3 - funcao tabfreq()
### Exemplo 2 - funcao stickchart() 

## Detalhar com a tabulacao foi realizada
#...

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
#...

# Grafico de ogiva
#...

# Poligono de frequencia
#...

# Grafico Boxplot
#...

# Grafico de pizza
#...

####################
# Medidas de posicao
####################

## Media
### Agrupado
#...
### Nao agrupado
#...

## Mediana
### Agrupado
#...
### Nao agrupado
#...

## Moda
### Agrupado
#...
### Nao agrupado
#...

## 3 medidas juntas
### Agrupado
#...
### Nao agrupado
#...

## Medidas representadas em graficos
#...

######################
# Medidas de dispersao
######################

# Amplitude
#...

# Modulo do desvio medio
# madev()

# Modulo do desvio mediano
# medev()

# Variancia
#...

# Desvio padrao
#...

# Coeficiente de Variacao
#...

# Erro padrao da media
#...

######################
# Assimetria e Curtose
######################

## Assimetria (Mostrar)
showskew()
## Calcular
#...

## Curtose (Mostrar)
showkur()


################################
# Distribuicoes de Probabilidade
# Distribuicoes Amostrais
################################

# Propriedades da Funcao de distribuicao
showcdf()

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
#...

## Funcao Quantil (Funcao Q())
#...

## Propriedades da distribuicao normal
### type = 1, 2, 3, 4, 5
propofnormal()

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








