#=================================================================================
# Disciplina de Estatística e Probabilidade (UFSJ)
# Ben Dêivide - <https://bendeivide.github.io/courses/epaec/>
# Aula 9 - Revisão P1
# Banco de dados: Os dados representam a temperatura (ºF) do anel de vedação de
# cada teste de acionamento ou lançamento real do motor do foguete Challenger
#-----------
# Livro referência:
# BATISTA, B. D. O.. Estatística e Probabilidade: aplicadas às Engenharias e Ciên-
# cias. Ouro Branco, MG: [s.n.]. 2023. XXX p.. ISBN 978-65-00-66079-1. Disponível
# em: <https://bendeivide.github.io/book-epaec/>. Acesso em:
#=================================================================================

# Instalando o pacote 'leem' (via CRAN)
install.packages("leem")
# (ou) Instalando via github
pkgs <- c("manipulate", "tkRplotR",
          "tkrplot", "crayon")
install.packages(pkgs)
## Instalando o pacote 'devtools'
install.packages("devtools")
## Instalando o pacote 'leem'
devtools::install_github("bendeivide/leem")


# Anexando o pacote leem
library(leem)


# Importando o banco de dados
con <- url("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/challenger.RData")
load(con); close(con)


# Verificando os dados
challenger


# Distribuicao de frequencia
challenger |>
  new_leem(variable = 2) |>
  tabfreq()

# Media
challenger |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean(grouped = TRUE)


# Variancia
challenger |>
  new_leem(variable = 2) |>
  tabfreq() |>
  variance(grouped = TRUE)


# Desvio padrao
challenger |>
  new_leem(variable = 2) |>
  tabfreq() |>
  sdev(grouped = TRUE)

# Erro padrao da media
challenger |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mse(grouped = TRUE)


# Ogivas
challenger |>
  new_leem(variable = 2) |>
  tabfreq() |>
  ogive(both = TRUE,
        histogram = TRUE) |>
  insert(type = "all",
         lcol = c("brown",
                  "red",
                  "blue"))
