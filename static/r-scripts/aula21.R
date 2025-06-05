# Universidade Federal de São João del-Rei
# Departamento de Estatística, Física e Matemática (DEFIM)
# Prof. Ben Dêivide (http://bendeivide.github.io)
# Aula 21 - Distribuibuicoes de probabilidade

# d binom, pois, norm, t, f, chisq
# p binom, pois, norm, t, f, chisq
# q binom, pois, norm, t, f, chisq
# r binom, pois, norm, t, f, chisq


# Exercicio Proposto 6.2
px <- dbinom(x = 3, size = 100, p = 0.02)
# Arredondamento 4 casas dec
round(px, 4)

# Exercicio Proposto 6.3
# a)
pnorm(q = 0, mean = 0, sd = 1, lower.tail = T)
pnorm(0.35) - pnorm(0)

# b)
pnorm(1.52) - pnorm(0)

# c) 
pnorm(-1.91, lower.tail = F)

# d) 
pnorm(1.13)

# e)
pnorm(-2.13)

# Exercicio Proposto 6.4
# 1)
pnorm(q = 33, mean = 40, sd = 6)
# 2)
pnorm(q = 29, mean = 40, sd = 6, lower.tail = F)
# 3)
qnorm(p = 0.58, mean = 40, sd = 6, lower.tail = F)
# 4)
qnorm(p = 0.05, mean = 40, sd = 6, lower.tail = F)

# Exercicio Proposto 6.11
# a)
dpois(x = 0, lambda = 0.3)
# b)
ppois(q = 1, lambda = 0.1, lower.tail = F)
# c)
ppois(q = 2, lambda = 0.6, lower.tail = T)
