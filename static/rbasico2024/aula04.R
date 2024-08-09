# Aula 04

# Principio 1: Tudo em R é um objeto
10 + 20
# comprimento
length(10)
length(`+`)
#modo
mode(`+`)
mode(10)
typeof(10)
typeof(`+`)
is.vector(10)
# Principio 2: Tudo em R é uma chamada de função
`+` #Execute e veja que isto é uma função
# Principio 3: Interface é parte do R
`+`
#function (e1, e2)  .Primitive("+")
# a função .Primitive() é uma função
# que se comunica com funções em linguagem
# C. Portanto, ela é uma interface R para C!

# Ideia de escopo léxico
x <- 10
f1 <- function() {
  x
}
f1()