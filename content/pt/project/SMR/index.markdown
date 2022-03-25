---
title: Pacote SMR
summary: Um pacote R que apresenta a distribuição da midrange estudentizada externamente de uma população normal
tags:
- SMR
date: "2021-05-06 23:40:04"

# Optional external URL for project (replaces project detail page).
# external_link: "https://cran.r-project.org/package=SMR/"


image:
  focal_point: Smart

links:
- icon: r-project
  icon_pack: fab
  name: Acesse-o no CRAN
  url: http://cran.r-project.org/package=SMR
- icon: twitter
  icon_pack: fab
  name: Siga-me
  url: https://twitter.com/bendeivide
- icon: facebook
  icon_pack: fab
  name: Siga-me
  url: https://facebook.com/bendeivide
- icon: instagram
  icon_pack: fab
  name: Siga-me
  url: https://instagram.com/bendeivide
- icon: youtube
  icon_pack: fab
  name: Se inscreva
  url: https://youtube.com/bendeivide

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
#slides: example
slides: ""

# Remove various "share" icons for portfolio widget
# Eles ficam em theme/starter-academic/data/page_sharer.toml
# Link de ajuda: https://github.com/wowchemy/wowchemy-hugo-modules/issues/1611
share: true
---

## Objetivo

O pacote [SMR](http://cran.r-project.org/package=SMR) computa a distribuição (função densidade, função de distribuição, função quantil) da distribuição da *midrange* estudentizada externamente de uma população normal, bem como o algoritmo para gerar números aleatórios dessa distribuição.

## Origem do projeto

O pacote [SMR](http://cran.r-project.org/package=SMR) foi originado como resultado da dissertação intitulada [Distribuição exata da midrange estudentizada externamente da normal e desenvolvimento de uma biblioteca R utilizando Quadratura Gaussiana](http://repositorio.ufla.br/bitstream/1/753/1/DISSERTA%c3%87%c3%83O_Distribui%c3%a7%c3%a3o%20exata%20da%20midrange%20estudentizada%20externamente%20da%20normal%20e%20desenvolvimento%20de%20uma%20biblioteca%20R%20utilizando%20Quadratur.pdf), de autoria de [Ben Dêivide de Oliveira Batista](http://bendeivide.github.io/), orientada pelo Prof. [Daniel Furtado Ferreira](https://des.ufla.br/~danielff/), pela [Universidade Federal de Lavras](http://ufla.br).

## Membros

- [Ben Dêivide de Oliveira Batista](http://bendeivide.github.io/)
- [Daniel Furtado Ferreira](https://des.ufla.br/~danielff/)


## Onde Encontrar o projeto

O pacote se encontra sob o [CRAN](http://cran.r-project.org/package=MCPtests) desde 2014. O repositório GitHub, bem como a página do pacote ainda está sendo desenvolvida.

## Publicações

- [Artigo da distribuição analítica da estatística *midrange* estudentizada externamente de uma normal](http://repositorio.ufla.br/bitstream/1/29962/1/ARTIGO_Externally%20studentized%20normal%20midrange%20distribution.pdf)
- [Artigo do pacote](https://journal.r-project.org/archive/2014/RJ-2014-029/index.html)
- [Publicação do pacote sob o CRAN](http://cran.r-project.org/package=SMR)

## Contribuições ainda a serem realizadas

- GUI para o pacote;
- Implementar o cálculo da quadratura Gauss-Legendre em C/C++;
- Implementar o método Newton-Raphson para o cálculo da função quantil em C/C++.
