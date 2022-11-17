---
title: Como desenvolver o primeiro pacote R
date: "2022-18-11T00:00:00Z"
summary: ''
authors: [Admin]
tags: [R, Pacotes R]
categories: [Minicurso]
slides:
#  css: night
# https://github.com/hakimel/reveal.js/tree/master/css/theme/source
# Choose a theme from https://github.com/hakimel/reveal.js#theming
# https://revealjs.com/themes/
# https://github.com/wowchemy/wowchemy-hugo-themes/issues/796
# https://bookdown.org/yihui/rmarkdown/revealjs.html
# https://github.com/hakimel/reveal.js/wiki/Plugins,-Tools-and-Hardware
# Tentativas:
# https://github.com/dzello/reveal-hugo
  theme: ''
# Choose a code highlighting style (if highlighting enabled in `params.toml`)
# Light style: github. Dark style: dracula (default).
  highlight_style: dracula
# Como controlar a apresentacao:
# - Next: `Right Arrow` or `Space`
# - Previous: `Left Arrow`
# - Start: `Home`
# - Finish: `End`
# - Overview: `Esc`
# - Speaker notes: `S`
# - Fullscreen: `F`
# - Zoom: `Alt + Click`
# - [PDF Export](https://github.com/hakimel/reveal.js#pdf-export): `E`

---


{{< slide background-image="hardcover.png" >}}

## Como desenvolver o primeiro pacote R
{{< icon name="user-tie" pack="fas" >}} [Ben Dêivide](https://bendeivide.github.io/) | 
{{< icon name="school" pack="fas" >}} [UFSJ](https://www.ufsj.edu.br/) 

<img src="logo.png" width="40%" height="70%" style="display: block; margin: auto;" />

---

{{< slide background-image="hardcover.png" >}}

## Selo DC

<img src="SeloDC-branco.png" width="40%" height="70%" style="display: block; margin: auto;" />

---

{{< slide background-image="hardcover.png" >}}

## Livros em desenvolvimento


<img src="livro.png" width="100%" height="100%" style="display: block; margin: auto;" />

---

{{< slide background-image="hardcover.png" >}}

## Pacotes estatísticos publicados

- [SMR](https://doi.org/10.32614/RJ-2014-029) (BATISTA; FERREIRA, 2014)
- [midrangeMCP](https://bendeivide.github.io/midrangeMCP/) (BATISTA; FERREIRA; OLIVEIRA, 2020)
  - [Alternative Tukey test](https://doi.org/10.1590/1413-7054202044008020)
- [MCPtests](https://github.com/bendeivide/MCPtests) (BATISTA; FERREIRA; OLIVEIRA; SANTOS, 2020)
- [TVMM](https://rpubs.com/Henriqueufla/617206) (ALVES; FERREIRA; BATISTA, 2020)
- [cppcor](https://cran.r-project.org/web/packages/cppcor/index.html) (RIBEIRO; BATISTA; MARTINS; OLIVEIRA, 2020)

---

{{< slide background-image="hardcover.png" >}}

## Pacotes em desenvolvimento

- [leem](https://github.com/bendeivide/leem)
- [statscience](https://github.com/bendeivide/statscience)


---

{{< slide background-image="hardcover.png" >}}

## O que é necessário?

- Conhecer o ambiente R ([R básico](https://bendeivide.github.io/books/eambr01/))
- A linguagem R instalada:
  - Pacote [devtools](https://devtools.r-lib.org/) e [usethis](https://usethis.r-lib.org/) (Kit de ferramentas)
  - Pacote [roxygen2](https://roxygen2.r-lib.org/) (Documentação R);
- RStudio (Opcional) <https://rstudio.com/>
- Rtools (Windows) <https://cran.r-project.org/bin/windows/Rtools/> 
- `\(\LaTeX\)` <https://miktex.org/download>
  - Alternativa: instalar o pacote [tinytex](https://yihui.org/tinytex/)
  
  
---

{{< slide background-image="hardcover.png" >}}

### Conhecendo a estrutura básica de um pacote


<img src="est_pacote01.png" width="40%" height="70%" style="display: block; margin: auto;" />

---

{{< slide background-image="hardcover.png" >}}

### Criando um pacote com o RStudio

<iframe width="660" height="415" src="https://www.youtube.com/embed/aq4OL8IDRJ0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


---

{{< slide background-image="hardcover.png" >}}

<section>

<h2>aritmetica.R </h2>



```r
# Operacoes basicas da matematica
aritmetica <- function (a, b, op) {
           # op: divisi, multi, soma, subtra
           if (op == "divisi") x <- divisi(a, b)
           if (op == "multi") x <- multi(a,b)
           if (op == "soma") x <- soma(a,b)
           if (op == "subtra") x <- subtra(a,b)
           return(x)
         }
```

</section>

<section>

<h2>auxiliar.R </h2>



```r
soma <- function (a, b) { # Soma
          calculo <- a + b
          return(calculo)}
subtra <- function (a, b) { #Subtracao
            calculo <- a - b
            return(calculo)}
multi <- function (a, b) { # Multiplicacao
           calculo <- a * b
           return(calculo)}
divisi <- function (a, b) { # Divisao
            calculo <- a / b
            return(calculo)}
```

</section>

---

{{< slide background-image="hardcover.png" >}}

### Local para inserir `aritmetica.R` e `auxiliar.R`



<img src="est_pacote02.png" width="40%" height="70%" style="display: block; margin: auto;" />

---

{{< slide background-image="hardcover.png" >}}

<section>
<h2>Editando o DESCRIPTION</h2>

<img src="est_pacote03.png" width="40%" height="70%" style="display: block; margin: auto;" />

</section>


<section>

<h2>Arquivo DESCRIPTION</h2>

```{}
Package: meupacoter
Type: Package
Title: Funcoes Aritmeticas Basicas
Version: 1.0
Date: 2022-11-18
Author: Ben Deivide
Maintainer: Ben Deivide <ben.deivide@ufsj.edu.br>
Description: Este pacote realiza operacoes aritmeticas basicas utilizando dois numeros.
License: GPL (>= 2)
Encoding: UTF-8
RoxygenNote: 7.1.2
```

</section>

----

{{< slide background-image="hardcover.png" >}}

<section>
<h2>Editando o NAMESPACE</h2>

<img src="est_pacote04.png" width="40%" height="70%" style="display: block; margin: auto;" />

</section>


<section>

<h2>Arquivo NAMESPACE</h2>

```{}
exportPattern("^[[:alpha:]]+")
```

</section>

<section>
<h2> Importante </h2>

- O que nós vamos fazer é deletar o arquivo **NAMESPACE**
- Vamos deixar para que o pacote `roxygen2` gere-o.

</section>

---

{{< slide background-image="hardcover.png" >}}

## Configurando o `roxygen2`

<iframe width="560" height="315" src="https://www.youtube.com/embed/Nw8ZBlmy3Yw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


---

{{< slide background-image="hardcover.png" >}}

<section>
<h2>Criando a documentação básica do pacote</h2>

<iframe width="560" height="315" src="https://www.youtube.com/embed/YcPRWE6oD1E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</section>

<section>

<h2>Estrutura da documentação</h2>

```{}
\name{meupacoter-package}
\alias{meupacoter-package}
\alias{meupacoter}
\docType{package}
\name{aritmetica}
\alias{aritmetica}
\title{Operacoes Matematicas Basicas}
\description{
O pacote resolve operacoes como: soma, subtracao, divisao e multiplicacao.
}
\usage{
aritmetica(a, b, op)
}
\arguments{
\item{a}{primeiro numero}
\item{b}{segundo numero}
\item{op}{operacao matematica}
}
\details{
A função \code{aritmetica} realiza as quatro operacoes basicas. A opcoes para o argumento
\code{op} sao "soma", "divisi", "multi", "subtra"
}
\examples{
aritmetica(8, 4, op = "divisi")
}
```

</section>

<section>

<h2>Usando o roxygen2 em aritmetica.R</h2>

<img src="est_pacote05.png" width="40%" height="70%" style="display: block; margin: auto;" />

</section>

<section>
<h2>Estrutura da documentação pelo roxygen2</h2>

```r
#' Operacoes Matematicas Basicas
#'
#' \code{aritmetica} resolve operacoes como: soma, subtracao,
#'     divisao e multiplicacao.
#' @param a primeiro numero
#' @param b segundo numero
#' @param op operacao matematica
#' @return A função \code{aritmetica} realiza as quatro operacoes basicas. A opcoes para o argumento
#'     \code{op} sao "soma", "divisi", "multi", "subtra"
#' @examples
#' # Loading package
#' library(meupacoter)
#' aritmetica(8, 4, op = "divisi")
# @import "nomes de pacotes importados"
# @importFrom "Pacotes" "funcoes"
#' @export
aritmetica <- function (a, b, op) {
           # op: divisi, multi, soma, subtra
           if (op == "divisi") x <- divisi(a, b)
           if (op == "multi") x <- multi(a,b)
           if (op == "soma") x <- soma(a,b)
           if (op == "subtra") x <- subtra(a,b)
           return(x)}
```

</section>


---

{{< slide background-image="hardcover.png" >}}

### Organizando os arquivos

- Antes de compilarmos o pacote, vamos excluir o arquivo **NAMESPACE**, e todos os arquivos **./Man/~.Rd**;
- O diretório do pacote ficará assim:

<img src="est_pacote06.png" width="40%" height="70%" style="display: block; margin: auto;" />

---

{{< slide background-image="hardcover.png" >}}

### Atualizando o pacote com o `roxigen2`

<iframe width="560" height="315" src="https://www.youtube.com/embed/c7C9nSCGoPQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


--- 

{{< slide background-image="hardcover.png" >}}

### Checando o pacote

<iframe width="560" height="315" src="https://www.youtube.com/embed/pv98iNiOgqg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


--- 

{{< slide background-image="hardcover.png" >}}

### Submetendo ao CRAN

<https://cran.r-project.org/submit.html>

<iframe width="560" height="315" src="https://www.youtube.com/embed/ou20KCmxSZ0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

{{< slide background-image="hardcover.png" >}}

# Obrigado! 

Sugestões, perguntas, críticas...
