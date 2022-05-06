# Universidade Federal de São João del-Rei
# Departamento de Estatística, Física e Matemática (DEFIM)
# Disciplina de Estatística Computacional
# Prof. Ben Dêivide (http://bendeivide.github.io)
# Aula 12: Distribuicoes amostra e TLC
#---------------------------------------------------

# Pacotes utilizados
library(TeachingDemos)
#install.packages(TeachingDemos) # Para instalar


# Exemplos para calcular frequencia e densidade

# Dados aleatorios de uma normal
x <- rnorm(100)
# histograma
h <- hist(x)
# Valores ajustados
xfit <- seq(min(x), max(x), length = 200)
yfit <- dnorm(xfit)*diff(h$mids[1:2])*length(x)
# Densidade ajustada
lines(xfit, yfit)


# Distribuições amostrais

# Distribuição da média amostral de uma normal


# Dados aleatorios de uma normal
x <- rnorm(100)
# histograma
h <- hist(x, ylim = c(0,150))
# Valores ajustados
xfit <- seq(min(x), max(x), length = 200)
yfit <- dnorm(xfit)*diff(h$mids[1:2])*length(x)
yfitm <- dnorm(xfit, sd = 1 / sqrt(10))*diff(h$mids[1:2])*length(x)
# Densidade ajustada dos dados
lines(xfit, yfit)
# Densidade ajustada da distribuicao da media
lines(xfit, yfitm, lwd = 2, col= "red")

## Linha da média
abline(v = 0, lwd = 3, col = "yellow")

## Legenda
legend(x = "topright", 
       lty = 1,
       lwd = c(1, 2),
       col = c("black", "red"),
       legend = c("X", "Média"))


# Teorema do Limite Central (TLC)

clt.examp()
clt.examp(5)
clt.examp(30)
clt.examp(50)
clt.examp(100)
