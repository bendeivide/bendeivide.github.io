---
title: Pacote MCPtests
summary: Um pacote R em desenvolvimento para aplicação de testes de comparações múltiplas
tags:
- MCPtests
date: "2021-05-06 23:37:05"

# Optional external URL for project (replaces project detail page).
#external_link: "https://bendeivide.github.io/MCPtests/"

# Optional header image (relative to `assets/media/` folder).
image:
  caption: Foto criada por Ben Dêivide
  focal_point: Smart

links:
- icon: github
  icon_pack: fab
  name: Acesse o projeto
  url: https://github.com/bendeivide/MCPtests
- icon: r-project
  icon_pack: fab
  name: Acesse-o no CRAN
  url: http://cran.r-project.org/package=MCPtests
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

O pacote **MCPtests** é uma evolução do pacote [midrangeMCP](https://bendeivide.github.io/midrangeMCP/). Além da agregação de gráfico nos resultados dos testes, o tipo de entrada de dados, que é um diferencial com relação a outros pacotes, o **MCPtests** abrangerá um universo maior de testes, além de poder apresentar avaliação de desempenho dos testes em tempo real, via simulação Monte Carlo. Com isso, o poder de escolha de um teste pelo usuário, poderá ser mais criterioso, do que usar os testes convencionais da literatura sem nenhuma critério de escolha. 

Algo que ganhará destaque também será a saída. Além das exportações tradicionais encontradas no pacote [midrangeMCP](https://bendeivide.github.io/midrangeMCP/), usaremos os recursos do RMarkdown ao nosso favor, incluindo uma tomada de decisão mais intuitiva sobre os testes, bem como, avaliando e apresentando as suas pressuposições. 

Se o usuário desejar agregar Análise de Variância (ANAVA), também poderá ser utilizada em seus resultados, mas o enfoque é o resultado do PCM, uma vez que a sequência dos resultados da ANAVA e depois PCM é um padrão não obrigatório, e quase todo mundo sempre procedeu dessa forma como se fosse uma obrigatoriedade.

Outra vantagem do pacote é que suas teclas de atalho se assemelham com a ambientação do RStudio, tornando-o isso mais intuitivo.

## Origem do projeto

O projeto foi originado de outros dois projetos, o [Projeto UFSJ 003/2019/PROPE](https://bendeivide.github.io/project/projufsj/) e o [Projeto UFSJ 004/2019/PROPE](). Este último foi uma recomendação proposta de artigo de revisão para ser enviado a Revista Ciência e Agrotecnologia, que ainda está em desenvolvimento.

## Membros

- [Diego Arthur Bispo Justino de Oliveira](https://digoarthur.github.io/)
- [Matheus Fernando Santos](https://www.linkedin.com/in/matheus-fernando-santos-219555b0/)
- [Ben Dêivide de Oliveira Batista](http://bendeivide.github.io/)
- [Daniel Furtado Ferreira](https://des.ufla.br/~danielff/)

## Onde encontrar o projeto

Uma primeira versão do pacote já se encontra sob o [CRAN](http://cran.r-project.org/package=MCPtests), e suas alterações estão sendo atualizadas no repositório [GitHub](https://github.com/bendeivide/MCPtests). A página do pacote ainda está sendo desenvolvida.

## Publicações

- [V Workshop de Matemática e Matemática aplicada (UFSJ/UFLA)](https://ufsj.edu.br/wmma/v_wmma.php) [PDF](https://ufsj.edu.br/portal2-repositorio/File/wmma/wmma2020/diego.pdf)
- [Pacote publicado sob o CRAN](http://cran.r-project.org/package=MCPtests)
- Artigo para o *The R Journal* em fase de desenvolvimento.


## Contribuições ainda a serem realizadas

Contribuições ainda a serem feitas no pacote:

- Página do pacote;
- Implementação do algoritmo dos PCMs ao pacote;
- Implementações sobre a GUI, usando linguagem *Tcl/tk*;
- Relatório de análises;
- Implementações sobre as avaliações de desempenho dos testes via simulação Monte Carlo.
