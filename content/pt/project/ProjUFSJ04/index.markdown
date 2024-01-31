---
title: Projeto UFSJ 005/2021/PROPE 
summary: Projeto de Iniciação Científica do Edital 005/2021/Prope/UFSJ (PIBIC/CNPq)
tags:
- ufsj0052021
date: "2022-03-13 17:58:52"

# Optional external URL for project (replaces project detail page).
#external_link: "https://bendeivide.github.io/statscience/"
external_link: ""

image:
  focal_point: Smart

links:
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
## Introdução

Em 2012 foi publicado a primeira versão do pacote SMR sob o CRAN (BATISTA; FERREIRA, 2014). Em 2014, foram realizadas algumas correções do pacote para a publicação na revista do R "The R Journal". Esse pacote tem a finalidade de apresentar a função densidade de probabilidade, função distribuição, função qualtil e o gerador de números aleatórios da "midrange" estudentizada externamente de uma população normal, do qual a "midrange" é uma medida de tendência central, calculada pela soma da menor e maior observação em um conjunto de dados, divido por 2.

A aplicação desse pacote foi utilizada nos procedimentos de comparações múltiplas (PCM) desenvolvidos por Batista (2016), em sua conclusão de tese. Além do desenvolvimento de quatro PCMs, foi desenvolvido outro pacote R chamado midrangeMCP (2020) para a implementação desses procedimentos, do qual depende do pacote SMR. O grande problema que existe nesses pacotes é que como o R é uma linguagem interpretada, algumas implementações exigem um esforço maior da máquina para o cálculo de quadraturas gaussianas, que foi técnica numérica utilizada para a solução de cálculos de integrais duplas e triplas encontradas na distribuição da "midrange" estudentizada externamente de uma população normal. Assim, em algumas situações, os resultados obtidos por esses pacotes demoram segundos para a realização do cálculo.

Como solução, pensamos em implementar, justamente nesse ponto, o código em C/C++ e integrá-lo no ambiente R usando algumas API's disponíveis no próprio ambiente.

Um outro aspecto de abrangência será apresentar a distribuição da "midrange" estudentizada externamente centrada em qualquer parâmetro `\(mu\)` populacional (média populacional), uma vez que os pacotes apresentados anteriormente, foram implementados apenas com essa estatística centrada em 0 em uma população com distribuição normal.

Por fim, pensando em uma maior alcance do pacote SMR, será densenvolvido uma interface gráfica ao usuário (IGU), para facilitar a sua utiliza de usuários sem afinidade com o ambiente R, bem como os demais usuários.

## Objetivo

Portanto, os objetivos desse trabalho são:
- Implementar a quadratura gaussiana em código C/C++ e integrá-lo no pacote R SMR;
- Generalizar a implementação do pacote SMR para ser utilizado as distribuições da estatística "midrange" estudentizada externamente, em qualquer `\(mu\)` de uma população normal;
- Desenvolver uma IGU para o pacote SMR.

## Período de execução e local

{{< icon name="clock" pack="fas" >}} O projeto foi desenvolvido durante o período de março de 2021 a fevereiro de 2022, pelo Edital 004/2020/PROPE/UFSJ.

## Metodologia

Para o desenvolvimento desse trabalho, será revistidado todos os trabalhos que envolveram a implementação do pacote SMR, buscando artigos e códigos. Posteriormente, utilizaremos o ambiente R e pacote Rccp (EDDELBUETTEL; BALAMUTA, 2018) para integrar o código C/C++ no ambiente R. Em um segundo momento, faremos as alterações devidas no pacote SMR para a generalização da distribuição. Por fim, faremos a implementação da sua interface gráfica (IGU) usando o pacote tcltk, uma integração da linguagem Tcl/Tk com o ambiente R, para uma melhor utilização do pacote com usuários não ambientados com o R.

## Plano de trabalho

Primeira Etapa: Desenvolvimento do algoritmo em C/C++ sobre as quadraturas gaussianas e implmentá-las no pacote SMR ( 4 meses iniciais);

Segunda Etapa: Implementação no código do pacote SMR a generalização da distribuição da "midrange" estudentizada externamente para uma normal com média `\(mu\)` (4 meses intermediários);

Terceira Etapa: Criação da IGU implmentada em TclTk e integrado no ambiente R (4 meses finais).

## Referências

BATISTA, B. D. de O.; FERREIRA, D. F. SMR: Externally Studentized Midrange Distribution. Vienna, Austria, 2014. R package version 2.0. Disponível em: .

BATISTA, B. D. de O.; FERREIRA, D. F. midrangeMCP: Multiple comparisons procedures based on
studentized midrange and range distributions. Vienna, Austria, 2020. R package version 3.1. Disponível em: .

BATISTA, B. D. de O. Teste de comparações múltiplas baseados na distribuição da midrange
estudentizada externamente. 194 p. Tese (Doutorado) ? Universidade Federal de Lavras, Lavras, MG,
2016.

EDDELBUETTEL, D.; BALAMUTA, J. J.. Extending R with C++: A Brief Introduction to Rcpp. The American Statistician. 72(1). 2018. URL: https://doi.org/10.1080/00031305.2017.1375990.

R CORE TEAM. R: A language and environment for statistical computing. Vienna, Austria, 2021.

## Membros

- Orientando: [Diego Arthur Bispo Justino de Oliveira](https://digoarthur.github.io/)
- Orientador: [Ben Dêivide de Oliveira Batista](http://bendeivide.github.io/)

## Relatório Final

O projeto ainda está em andamento.

## Trabalhos publicados

O projeto está em andamento.

## Considerações 

O projeto está em andamento.
