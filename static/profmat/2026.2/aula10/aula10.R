# Pacote
library(leem)

# Entendendo a dist normal
showpar()

# Calculando a prob da normal
P(90, dist = "normal", 
  mean = 100, sd = 5, gui = "tcltk")


P(95 %<=X<=% 102, dist = "normal", 
  mean = 100, sd = 5, gui = "plot")

pnorm(102, mean = 100, sd = 5) - pnorm(95, mean = 100, sd = 5)
