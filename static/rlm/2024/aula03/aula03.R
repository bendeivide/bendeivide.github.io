# Dados
attach(cars)

# Grafico
plot(speed, dist)

# RLS
reg <- lm(dist ~ speed)

# Modelo no grafico
abline(reg)

