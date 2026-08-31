# Anexar o pacote leem
library(leem)

# Simular um conjunto de dados
# Variavel quantitativa continua
set.seed(10)
dados <- rnorm(100, 100, 2);dados

# Tabular usando o pacote leem (Forma 1)
dados_processados <- new_leem(dados, variable = "continuous")
## tabulando os dados com intervalo de classe
tabela <- tabfreq(dados_processados, k = 8)

# Grafico de histograma
hist(tabela, barcol = heat.colors(8))

# Grafico de pizza
piechart(tabela)

# Tabular usando o pacote leem (Forma 2)
dados_processados <- new_leem(dados, variable = "continuous")
## tabulando os dados com intervalo de classe
tabela <- tabfreq(dados_processados, k = 8)

dados |> 
  new_leem(variable = 2) |>  # 2 => "continuous"
  tabfreq(k = 8) |>
  hist()


