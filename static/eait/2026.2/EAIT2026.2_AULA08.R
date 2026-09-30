# Distribuicao binomial
## Ex.: X~Bin(n = 2, p = 1/2)
#############################

# Funcao de probabilidade
#------------------------
# P(X = 0)
dbinom(x = 0, size = 2, prob = 1/2)
dbinom(0, 2, 1/2)

# P(X = 1)
dbinom(1, 2, 1/2)

# P(X = 2)
dbinom(2, 2, 1/2)


# Funcao de distribuicao
#-----------------------

# F(0)
pbinom(0, 2, 1/2)

# 1 - F(0)
1 - pbinom(0, 2, 1/2)
pbinom(0, 2, 1/2, lower.tail = FALSE)

## Ex.: X~Bin(n = 10, p = 1/2)
#############################

# P(X = x)
dbinom(0:10, 10, 1/2)

# P(2  <= X <= 6) = P(X = 2) + P(X = 3) + ...
#           ... + P(X = 4) + P(X = 5) + P(X = 6)
sum(dbinom(2:6, 10, 1/2))
pbinom(6, 10, 1/2) - pbinom(1, 10, 1/2)
pbinom(1, 10, 1/2, lower.tail = FALSE) - pbinom(6, 10, 1/2, lower.tail = FALSE) 


# Dist Normal
## X ~ N(100, 2)
###################

# P(X <= 100) = P(X < 100)
pnorm(100, mean = 100, sd = 2)

# Usando o pacote leem
library(leem)

# Computo das probabilidade pela funcao P()
P(100, dist = "normal", mean = 100, sd = 2,
  gui = "plot", porcentage = FALSE)


# P(95 < X < 102)
pnorm(102, 100, 2) - pnorm(95, 100, 2)
#Usando o leem
P(98 %<=X<=% 102, dist = "normal", mean = 100, sd = 2,
  gui = "shiny")


# Exemplo de simulacao
set.seed(10)
s1 <- rnorm(100, 100, 2)
s2 <- rnorm(100, 100, 2)
s3 <- rnorm(100, 100, 2)
View(cbind(s1, s2, s3))
trat <- c(rep("s1", 100), rep("s2", 100), rep("s3", 100))
# Experimento de sensores
trat <- as.factor(trat)
vr <- c(s1, s2, s3)

# Pacote ExpDes
library(ExpDes)

crd(
  treat = trat,
  resp = vr,
  quali = TRUE,
  mcomp = "sk"
)
