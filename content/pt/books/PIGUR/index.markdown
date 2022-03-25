---
title: Programação de Interface Gráfica ao Usuário no R
subtitle: usando as linguagens Tcl/Tk e GTK+
summary: Livro em desenvolvimento
tags:
- booktcltk
categories: ["R", "Tcl/Tk", "GTK+", "GUI"]
date: "2021-08-31 10:08:11"

# Optional external URL for project (replaces project detail page).
# external_link: "https://bendeivide.github.io/cdec/"
external_link: ""

image:
  caption: Foto criada por Ben Dêivide
  focal_point: Smart

links:
- icon: github
  icon_pack: fab
  name: Acesse o projeto
  url: https://github.com/bendeivide/book-pigur
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

Esse livro surgiu a partir da ideia que propus ao outro autor desse projeto [Henrique josé de P. Alves](https://henriquealves21.github.io/webpage/), quando estávamos desenvolvendo em paralelo dois pacotes, [midrangeMCP](https://bendeivide.github.io/project/midrangemcp/) e o **TVMM** ([[CRAN](https://cran.r-project.org/package=TVMM)] [[*GUI*](https://rpubs.com/Henriqueufla/617206)]), e resolvemos deixá-los mais intuitivo para usuário que não tem afinidade com o ambiente *R*. De início eu usei o pacote [gWidgets](https://cran.r-project.org/web/packages/gWidgets/index.html) que tornava mais intuitivo a programação da *GUI*. Contudo, após o pacote ter se tornado órfã, resolvemos partir para o uso do pacote **tcltk** que foi um dos pacote base do pacote **gWidgets**. Este mesmo pacote também usava uma outra integração de linguagem, *GTK+*. Então usar o **gWidgets** era muito prático, infelizmente foi removido do CRAN. Quando nos aprofundamos nesse pacote, percebemos que seus autores haviam desenvolvido um livro muito interessante, intitulado [*Programming Graphical User Interfaces in R*](https://books.google.com.br/books?id=VeKEDwAAQBAJ&pg=PA418&lpg=PA418&dq=R+tkmenu&source=bl&ots=V2O2kTRNy3&sig=ACfU3U21CsBJES_jbMhh8JTnerP1FMbxpQ&hl=pt-BR&sa=X&ved=2ahUKEwj5lqOS3pvqAhX2IbkGHRAHClUQ6AEwA3oECAoQAQ#v=onepage&q=R%20tkmenu&f=false), um livro que despertou a nossa curiosidade nessa linha de pesquisa para desenvolvimento de pacotes. 
Assim, nasce esse projeto, em que de início, estudamos para inserir essa ferramenta em nossos pacotes, e agora, estudamos para repassar a nossa experiência por meio do Livro **Programação de Interface Gráfica ao Usuário no R**. 

Segue o repositório [GitHub](https://github.com/bendeivide/book-pigur), para a versão desse livro em *bookdown*.
