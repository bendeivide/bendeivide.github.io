# Dados
attach(cars)

# RLS
reg <- lm(dist ~ speed)

# Teste de Hipoteses
summary(reg)

