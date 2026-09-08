##############################################
# Curso Tidyverse e Ciencia de Dados
# ==================================
# AULA 02: OPERADOR PIPE
# Pagina do curso:
# https://bendeivide.github.io/courses/tidycd/
# Ben Deivide <https://bendeivide.github.io/>
##############################################

# O que eh um operador em R?
2 + 3
## funcao(arg1, arg2)
`+`(2, 3)

# O que eh o operador pipe
## op1 pipe op2
## Dados pipe funcR(arg1, arg2, ...)


## Operador pipe (magrittr)
library(magrittr)
1:10 %>%
  mean()
## Ex.1:Computar o desvio padrao
sd(1:10)
## com o operador pipe
desvpad <- 1:10 %>%
  var() %>%
  sqrt()
## com o operador pipe (nativo)
desvpad <- 1:10 |>
  var() |>
  sqrt()
# Formato tradicional
aux1 <- 1:10
aux2 <- var(aux1)
desvpad <- sqrt(aux2)


