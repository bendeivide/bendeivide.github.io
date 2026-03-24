#############################################
# AULA 02 - INTRODUCAO AO R
# DISCIPLINA: Estatistica & Probabilidade
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/epaec
#############################################

# R como calculadora (Para executar aperte o botao 'Run' ou Crtl+Enter)
2 + 3 # Adicao
3 - 1 # Subtracao
4 / 2 # Divisao
4 * 3 # Multiplicacao

# Principio 1: Tudo em R eh um objeto
## Exemplo de operacao de soma
10 + 20
## Atributo comprimento
length(10)
length(`+`)
## Atributo modo
mode(`+`)      # Tipagem S
mode(10)       # Tipagem S
typeof(10)     # Tipagem C
typeof(`+`)    # Tipagem C

# Principio 2: Tudo em R eh uma chamada de funcao
`+` # Execute e veja que isto eh uma funcao
# function (e1, e2)  .Primitive("+")

# Principio 3: Interface eh parte do R
`+`
#function (e1, e2)  .Primitive("+")
# a função .Primitive() eh uma funcao
# que se comunica com funcoes em linguagem
# C. Portanto, ela eh uma interface R para C!

