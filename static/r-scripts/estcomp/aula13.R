# Universidade Federal de São João del-Rei
# Departamento de Estatística, Física e Matemática (DEFIM)
# Disciplina de Estatística Computacional
# Prof. Ben Dêivide (http://bendeivide.github.io)
# Aula 13: Geradores aleatórios e Aproximação de distribuições
#---------------------------------------------------


# Gerando numeros aleatorios de uma distribuicao exponencial

rexponencial <- function(n, lambda) {
  if (!is.numeric(lambda) | lambda < 0) 
    stop("O argumento lambda deve ser numérico e maior que 0!", call. = FALSE)
  nunif <- runif(n)
  x <- (-log(1 - nunif)) / lambda
  return(x)
}


# Verificando graficamente
plot(sort(rexponencial(1000, lambda = 1)))
points(sort(rexp(1000, rate = 1)), col = "red")



# Aproximacao de distribuicoes
(x <- SMR:::GaussLegendre(2))
fx <- function(x) x^3 - 5 * x
fx2 <- function(x) x^2
fx3 <- function(x) (1.5 * x + 1.5)^2 # para x^3 [0, 2]

# O resultado fica assim
sum(x$weights * fx(x$nodes))

# Para fx2 temos
sum(x$weights * fx2(x$nodes))

# Para fx3 temos
1.5 * sum(x$weights * fx3(x$nodes))
