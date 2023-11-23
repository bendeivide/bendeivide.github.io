###############################################
# 2° Worshop: Experimentacao na Agricultura 4.0
# Palestra: Materiais didáticos e pacotes R 
#           para análise de experimentos
# Prof. Ben Deivide (DEFIM/UFSJ/CAP)
###############################################

dados1 <- read.table("https://raw.githubusercontent.com/bendeivide/book-eambr01/main/files/alfafa.txt",
                    h = T)
dados2 <- read.table("https://raw.githubusercontent.com/bendeivide/book-epaec/master/dados/cap02/dados_exem2.1.txt",
                     h = T)


######################
# Usando o pacote leem
######################
library(leem)

# Estatistica descritiva
dados2$challenger |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert()

# Probabilidade
showtabnormal(1.96)

# Estimacao
showci()

#############################
# usando o pacote midrangeMCP
#############################
library(midrangeMCP)
guimidrangeMCP()

#############################
# usando o pacote MCPtests
#############################
library(MCPtests)
guiMCP()

#############################
# usando o pacote statscience
#############################
library(statscience)


