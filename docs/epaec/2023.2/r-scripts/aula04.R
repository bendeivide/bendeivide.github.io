#######################################################
# AULA 04 - COLETA, ORGANIZACAO E APRESENTACAO DE DADOS
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
#######################################################

# Exemplo (Devore, 2006, p. 18): Cada membro de uma amostra de 120 individuos 
#   proprietarios de motocicletas foi indagado sobre a marca de sua moto. 
#   A distribuicao de freqencia dos dados resultantes é fornecida nos dados 
#   abaixo:
dado <- c(rep("honda", 41), rep("yamaha", 27),
          rep("kawasaki", 20), 
          rep("harley-davidson", 18), rep("bmw", 3),
          rep("outro", 11))

# Carregar pacote leem
library(leem)

# Criar a tabela de frequencias
dado |>
  new_leem(variable = 1) |> # construtor de objeto da classe leem
  tabfreq() 

# Criar o gráfico de pizza
dado |>
  new_leem(variable = 1) |> # construtor de objeto da classe leem
  tabfreq() |> # tabela de frequencia
  piechart() # grafico de pizza

# Exemplo (Montgomery e Runger, 2016): Dados representam a  planta de 
#  fabricação de semicondutores. Nessa planta, o semicondutor é um fio colado
#  a uma estrutura. A variável em estudo representa a resistência
#  à tração (lb f /pol2), isto é, uma força requerida para romper a cola. 
#  Os dados são apresentados a seguir.
dado2 <- c(9.95, 24.45, 31.75, 35, 25.02,
           16.86, 14.38, 9.6, 24.35, 27.5,
           17.08, 37, 41.95, 11.66, 21.65,
           17.89, 69, 10.3, 34.93, 46.59,
           44.88, 54.12, 56.63, 22.13, 21.15)
# comprimento do vetor
length(dado2)

# Ordenamento do vetor
sort(dado2)

# Tabela de frequencia
dado2 |>
  new_leem(variable = 2) |>
  tabfreq() 

## Recuperar o resultado
res <- dado2 |>
  new_leem(variable = 2) |>
  tabfreq()

## Alterando o valor de k
dado2 |>
  new_leem(variable = 2) |>
  tabfreq(k = 6)


# Grafico de histograma
dado2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() 

# Grafico de ogiva
dado2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(bars = TRUE, both = TRUE,
        histogram = TRUE,
        histcol = "red"
  ) 

# Intersecao das ogivas (mediana)
dado2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(bars = TRUE, both = TRUE,
        histogram = TRUE,
        histcol = "red"
  ) |>
  insert(type = "median")
