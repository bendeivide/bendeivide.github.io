
# Filosofia de publicação (Selo DC)

<a href="https://bendeivide.github.io/dc/" target="_blank" style="text-align: center;">

<img src="SeloDC-branco.png" width = "400">

</a>

# Livro de Apoio

Usaremos Batista ([2023](#ref-batista2023)):

<a href="https://bendeivide.github.io/books/epaec/" target="_blank" style="text-align: center;">

<img src="hardcover.png" width = "300">

</a>

# Relembrando aula 01

## Método Científico

<iframe width="1000" height="515" src="https://www.youtube.com/embed/QPeS1v7l6yk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>

## Definições Gerais da Estatística

<div class="notes">

📝 Mostrar a relação do Método científico com as Definições gerais da estatística (Smoothdraw)

</div>

<iframe width="1000" height="515" src="https://www.youtube.com/embed/mASLUwyaC5Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>

## Definições Gerais da Estatística

<div class="notes">

📝 Mostrar a relação do Método científico com as Definições gerais da estatística (Smoothdraw)

</div>

<iframe width="1000" height="515" src="https://www.youtube.com/embed/xvORKHMVUr8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>

## Natureza das variáveis

<iframe width="1000" height="515" src="https://www.youtube.com/embed/LIg6uLzCRmU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>

## Técnicas de Somatório

<div class="notes">

📝 Fazer alguns exemplos na sala digital (Smoothdraw)

</div>

<iframe width="1000" height="515" src="https://www.youtube.com/embed/tWCxCyZZHes" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>

# Problemas

- Problema 1: Observou-se o tempo, em minutos, que os atendimentos de clientes de uma determinada empresa telefônica demoravam para serem atendidos. O objetivo do estudo era verificar se o tempo médio, em minutos, do atendimento era superior a 10 minutos;
- Problema 2: Taxa de desmatamento da Amazônia legal

## Problema 1

<div class="columns">

<div class="column" width="50%">

</div>

<div class="column" width="50%">

<center>

<img src="fases_pesq_cientifica.png" title="Imagens: EPAEC" width = "500">

</center>

</div>

</div>

## Problema 2

<div class="columns">

<div class="column" width="50%">

</div>

<div class="column" width="50%">

<center>

<img src="txdesmat.PNG" title="Imagens: EPAEC" width = "500">

</center>

</div>

</div>

# Pacote `leem`

<div class="columns">

<div class="column" width="80%">

``` r
library(leem)
uf <- c("PA", "MT", "RO", "AM", "MA", "AC", "TO", "RO", "AP")
uf |>
  new_leem(variable = 1) # ou new_leem(variable = "discrete")
```

    ## [1] "PA" "MT" "RO" "AM" "MA" "AC" "TO" "RO" "AP"

``` r
library(leem)
uf <- c("PA", "MT", "RO", "AM", "MA", "AC", "TO", "RO", "AP")
ufleem <- new_leem(uf, variable = 1) # ou new_leem(variable = "discrete")
ufleem
```

    ## [1] "PA" "MT" "RO" "AM" "MA" "AC" "TO" "RO" "AP"

``` r
class(ufleem)
```

    ## [1] "leem"

</div>

<div class="column" width="20%">

<center>

<img src="leem.png" title="Imagens: Logo leem" width = "500">

</center>

</div>

</div>

## Pacote `leem`

<div class="columns">

<div class="column" width="80%">

``` r
library(leem)
ncid <- c(144, 141, 52, 62, 181, 22, 139, 15, 14)
ncid |>
  new_leem(variable = 1) # ou new_leem(variable = "discrete")
```

    ## [1] 144 141  52  62 181  22 139  15  14

``` r
library(leem)
ncid <- c(144, 141, 52, 62, 181, 22, 139, 15, 14)
ncidleem <- new_leem(ncid, variable = 1) # ou new_leem(variable = "discrete")
ncidleem
```

    ## [1] 144 141  52  62 181  22 139  15  14

``` r
class(ncidleem)
```

    ## [1] "leem"

</div>

<div class="column" width="20%">

<center>

<img src="leem.png" title="Imagens: Logo leem" width = "500">

</center>

</div>

</div>

## Pacote `leem`

<div class="columns">

<div class="column" width="90%">

``` r
library(leem)
atot <- c(1245870, 903207.02, 237765.20, 1559167.89,
          276419.84, 164123.96, 277466.76, 223644.53, 142470.76)
atot |>
  new_leem(variable = 2) # ou new_leem(variable = "continuous")
```

    ## [1] 1245870.0  903207.0  237765.2 1559167.9  276419.8  164124.0  277466.8
    ## [8]  223644.5  142470.8

``` r
library(leem)
atot <- c(1245870, 903207.02, 237765.20, 1559167.89,
          276419.84, 164123.96, 277466.76, 223644.53, 142470.76)
atotleem <- new_leem(atot, variable = 2) # ou new_leem(variable = "discrete")
atotleem
```

    ## [1] 1245870.0  903207.0  237765.2 1559167.9  276419.8  164124.0  277466.8
    ## [8]  223644.5  142470.8

``` r
class(atotleem)
```

    ## [1] "leem"

</div>

<div class="column" width="10%">

<center>

<img src="leem.png" title="Imagens: Logo leem" width = "500">

</center>

</div>

</div>

# Questões?

<a href="https://bendeivide.github.io/" data-preview-link="true">Dúvidas e Sugestões</a>

<a href="https://bendeivide.github.io/#contact" data-preview-link="true">Contato</a>

# Próximas aulas

<a href="https://bendeivide.github.io/courses/epaec/" target="_blank" style="text-align: center;">

<img src="ben.png" width = "400">

</a>
<center>
<a href="/courses/epaec"  target="_blank" >bendeivide.github.io/courses/epaec</a>
</center>

# Referências

<div id="refs" class="references csl-bib-body">

<div id="ref-batista2023" class="csl-entry">

BATISTA, B. D. O. **[Estatística e Probabilidade: Aplicada às Engenharias e Ciências](https://bendeivide.github.io/books/epaec/)**. Ouro Branco, MG, Brasil: \[s.n.\], 2023.

</div>

</div>
