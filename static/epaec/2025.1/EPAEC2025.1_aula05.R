# Definir semente para reprodutibilidade
set.seed(123)

# Gerar 30 observações de temperatura (simulação)
temperatura <- rnorm(30, mean = 78, sd = 2)  # Média de 78°C e desvio padrão de 2°C

temperatura |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean()
