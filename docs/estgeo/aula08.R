# Curso Estatistica e Geotecnia
# Aula 09 - Analise Descritiva
# Prof. Ben Deivide (UFSJ)
#################################

# Criando o banco de dados ficticio
set.seed(10)
# Dados
dados_geotecnia <- data.frame(
  Profundidade = rep(seq(1, 10, by = 1), times = 2),  # 10 camadas repetidas para dois furos
  SPT = sample(5:50, 20, replace = TRUE),  # Índice de SPT
  Umidade = round(runif(20, 10, 35), 2),  # Umidade natural
  Densidade = round(runif(20, 1.5, 2.2), 2),  # Densidade aparente
  Coesao = round(runif(20, 10, 100), 2)  # Coesão do solo
)

# Umidade
dados_geotecnia$Umidade

# Analise Descritiva
umid <- dados_geotecnia$Umidade

# Tamanho n
length(umid)

## Ordenamento
sort(umid)

## Tabulacao
library(leem)
umid |>
  new_leem(variable = 2) |>
  tabfreq()

## Graficamente

### Histograma
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist()
### Poligono
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq(freq = "p")


## Medidas

### Medidas de posicao

#### Media
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean() 

#### Mediana
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median() 

##### Mediana graficamente 
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  polyfreq(freq = "p") |>
  insert(type = "median")

#### Mediana
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq() 

#### Media, Mediana e Moda
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mpos() 

### Medidas de dispersao

#### Variancia
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  variance()

#### Desvio padrao
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  sdev()

#### Desvio padrao
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  cv()

### Assimetria
umid |>
  new_leem(variable = 2) |>
  tabfreq() |>
  skewness()

