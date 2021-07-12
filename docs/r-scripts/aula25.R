# Universidade Federal de Sao Joao del-Rei
# Departamento de Estatistica, Fisica e Matematica (DEFIM)
# Prof. Ben Deivide (http://bendeivide.github.io)
# Aula 25 - Teoria da Estimacao


######################
# Estimadores Pontuais
######################

# Metodos de Estimacao:
# --------------------

# Metodo da Maxima Verossimilhanca
library(TeachingDemos) 
##
if (interactive()) {
  # Pop Normal rnorm(10, 10, 2)
  mle.demo(start.sd = 2)
}

# Metodo dos Minimos Quadrados
library(tcltk)
demo(tkcanvas, package = "tcltk")


# Estimadores intervalares
# ------------------------
# Acesse: https://bendeivide.shinyapps.io/Est_Exp/#section-revis%C3%A3o-sobre-teste-de-hip%C3%B3teses

library(TeachingDemos)
if (interactive()) {
  run.ci.examp()
}
