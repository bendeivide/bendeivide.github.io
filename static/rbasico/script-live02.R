##################################################
# Script para Live 02 - 21/09/2023
# Prof. Ben Deivide | httpa://bendeivide.github.io
# Curso EAR: R basico
##################################################


#####################
# Pergunta do YouTube
#####################

# Pergunta de Joao Mateus
# -----------------------
# Quando eu associo o x com o 10L (x <- 10L) e em seguida eu 
# associo o y com o x (y <- x), tanto o x quanto o y terão a 
# mesma referência (endereço de memória) do 10L. O mesmo acontece 
# quando eu faço em linhas separadas? Ex.: x <- 10L; y <-- 10L 
# x e y estão associados ao mesmo 10L ou diferentes 10L’s, 
# como se fosse um objeto para cada? Muito obrigado pela aula, 
# sucesso!
###################################################

x <- 10L
y <- x
w <- 10L



###################
# QUESTOES DO LIVRO
###################

# Solucao da pergunta 01
#-----------------------
# Pergunta: Crie um quadro de dados a partir de uma 
#           lista, sem usar a função 'data.frame()'.
####################################################

# Vamos criar um quadro de dados
quadro_dados <- data.frame(a = 1, b = TRUE, c = "A")

# Verificando os atributos
attributes(quadro_dados)

# Imprimindo 'quadro_dados'
quadro_dados

# Omitindo a classe 'data.frame'
unclass(quadro_dados)
nao_qd <- unclass(quadro_dados)

# Vamos perguntar?
is.data.frame(quadro_dados)
is.data.frame(nao_qd)

# Qual o tipo de objeto?
typeof(quadro_dados)
typeof(nao_qd)

# Crie um data.frame a partir de uma lista
attr(nao_qd, "class") <- "data.frame"

# Imprima 'nao_qd'
nao_qd

# Agora, 'nao_qd' eh um 'data.frame'?
is.data.frame(nao_qd)


# Solucao da pergunta 02
#-----------------------
# Pergunta: Observe o codigo abaixo. Por que não foi 
#           possível calcular a média para `y`? Será 
#           que foi porque não usamos 
#           `mean(dado$y)`? Explique.
####################################################

# Objeto lista
dados <- list(
  mean = mean <- function(...) print("Nada"),
  y = 1:10,
  z = rep(c(TRUE, FALSE), 5)
)
# Quebra do quadro de dados
attach(dados)
detach(dados)
# calcular a media de y
base::mean(dados$y)


# Solucao da pergunta 03
#-----------------------
# Pergunta: Vejamos a seguinte implementação:
#############################################

# Instalando o pacote leem
install.packages("leem")
# Anexando o pacote leem
library(leem)
# Criando um histograma
x <- rnorm(36, 100, 4)
x <- new_leem(x, variable = 2)
x <- tabfreq(x)
# Gerando um histograma de frequencias
hist(x)
# Usando o operador pipe
x <- rnorm(36, 100, 4)
x |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist()
