---
title: R como uma ferramenta acadêmica
summary: Mostraremos nessa apresentação, uma quantidade de ferramentas que o ambiente R pode lhe proporcionar em sua vida profissional.
authors: [Ben Dêivide]
tags: [Ambiente R]
categories: [palestra]
date: "2019-02-05T00:00:00Z"
slides:
  # Choose a theme from https://github.com/hakimel/reveal.js#theming
  theme: black
  # Choose a code highlighting style (if highlighting enabled in `params.toml`)
  #   Light style: github. Dark style: dracula (default).
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

# R como uma ferramenta acadêmica

[Ben Dêivide](https://bendeivide.github.io/) | [UFSJ](https://www.ufsj.edu.br/)

---

## Apresentação com selo DC

[![](SeloDC-branco.png)](https://bendeivide.github.io/dc/)

---

## Acesso ao material dessa apresentação

[![](folder.png)](https://github.com/bendeivide/palestras/tree/master/ramb-academico)

---

## Nota

Essa apresentação terá um viés, pois apesar do poder que a ambiente `R` tem, muitos dos exemplos estarão dentro das minhas necessidades/limitações pessoais e profissionais. Portanto, um resultado do que experimento e venho experienciando!

---

## Histórico sobre o ambiente `R` 

- Criadores Ross Ihaka e por Robert Gentleman (Nova Zelândia), 1993
- Baseado na linguagem S, criado por John Chambers e colaboradores (Primeira versão 1976)
- Atualmente é mantida por colaboradores voluntários em todo o mundo

---

## Histórico sobre o ambiente `R` 

- Linguagem pode ser orientada a objetos, Código aberto, funcional, metapragmática, Licença GNU
- Repositório [CRAN](https://cran.r-project.org/)
- Popularidade com o [RStudio](https://rstudio.com/) (Joseph J. Allaire)
- Como instalar o R?
Como instalar o RStudio?
- Como usar o R?

---

## Curso R (Nível Básico)

[![Nível Básico](cursor-nb.png)](https://bendeivide.github.io/courses/cursor/nbasico/)

---

## Curso R (NI)

[![Nível Intermediário](cursor-ni.png)](https://bendeivide.github.io/post/cursorni2/)

---

## Rapidinhas do R

[![](rapidinhasr.png)](https://bendeivide.github.io/project/rapidinhasr/)

---

## Ferramentas do `R` além do fim Estatístico

- Análises Estatísticas ❌
- Criação e divulgação de materiais científicos:
  - Materiais Dinâmicos (HTML, JavaScript, CSS, `\(\LaTeX\)`, `R`, PDF) ✔️
  - Materiais estatísticos (HTML, PDF, EPUB, WORD, SLIDES) ✔️

---

## Ferramentas do `R` além do fim Estatístico

- Desenvolvimento de pacotes  ✔️
  - Criação de GUIs para pacotes (Pacotes `tcltk`, `GTK+`, `shiny`) ✔️
  - Documentação de pacotes (Vignettes, tutorial de pacote) ✔️
- Divulgação de todos esses materiais ✔️

---

##  O que será necessário para usar essas ferramentas?

- [Instalação do `R`](https://youtu.be/Gei-gtBlMos) e [RStudio/Pandoc](https://youtu.be/Gei-gtBlMos)
- No `R` [instalar os pacotes](https://youtu.be/YRSdoyfqp_g):
  - `rmarkdown` e `knitr` - Pacotes mais importantes!
  - `shiny` - Pacote para criação de materiais dinâmicos
  - `devtools` e `usethis` - kit de ferramentas
  - `rsconnect` - Pacote para enviar seu arquivo para *shinyapps.io*

---

##  O que será necessário para usar essas ferramentas?

- No `R` [instalar os pacotes](https://youtu.be/YRSdoyfqp_g):
  - `tinytex` - Latex (Caso você não queira instalar o `\(\LaTeX\)`)
  - `rticles` - Escrever Artigos
  - `thesisdown` - Escrever Teses
  - `bookdown` - Escrever Livros (HTML, PDF, ePub, Kindle)

---

##  O que será necessário para usar essas ferramentas?

- No `R` [instalar os pacotes](https://youtu.be/YRSdoyfqp_g):
  - `blogdown` e `distill` - Criação de blogs, websites
  - `postcards` - Criação de um cartão de visita
  - `learnr` - Criação de tutoriais para aprender R
  - `pkgdown`(Documentação em HTML para pacotes R) e `usethis` ou `rmarkdown`(Criação de Vignettes)
  
---

##  O que será necessário para usar essas ferramentas?

- No `R` [instalar os pacotes](https://youtu.be/YRSdoyfqp_g):
  - `tcltk` (Existem muitos outros pacotes!) - GUI's
  - `manipulate` e `shiny` - gráficos interativos no RStudio e `scatterplot3d` - Gráficos em 3d
  - `exams` - Criação de Provas para disciplinas + MOODLE
- `\(\LaTeX\)`, MS Word (ou similares)
  
---

##  `R` Markdown

Três componentes básicos:
  - **Metadados**: O corpo do documento 
  - **Texto**: Assunto dissertado 
  - **Código**: Linguagem de interesse 

**LEMBRETE**: A extensão de um arquivo R Markdown é: *.Rmd*

---

##  Material de apoio ao `R` Markdown

[![](cdec.png)](https://bendeivide.github.io/cdec/)

---

##  Material de apoio ao `R` Markdown

O básico no R Markdown:
<https://rmarkdown.rstudio.com/authoring_basics.html>

A ideia dos pacotes nos documentos dinâmicos:
<https://jreduardo.github.io/semanest-ufpr2017/>

Para leitura:
<http://cursos.leg.ufpr.br/prr/capDocDin.html>

---

{{< slide background-image="/media/boards.jpg" >}}

## `R` Markdown: Documentos estatísticos

Aplicações:

![](rstudio.png)

---

##  `R` Markdown: Documentos dinâmicos

Recursos do Shiny:

Exemplos:
  - [Srag ou Covid-19 (UFRN)](http://shiny.estatistica.ccet.ufrn.br/srag/)
  - [*Trends* do Google (RStudio)](https://shiny.rstudio.com/)
  - [Processo de modelagem didática](https://shiny.rstudio.com/gallery/didacting-modeling.html)

---

## Criação de *Websites*

- Website (pacote [`distill`](https://rstudio.github.io/distill/)): [Rapidinhas do R](https://youtu.be/FbTLrfYWQQw), ex. [Curso R](https://bendeivide.github.io/cursor/)
- Website via [`blogdown`](https://pkgs.rstudio.com/blogdown/) e [`Hugo`](https://wowchemy.com/docs/) ([temas](https://wowchemy.com/templates/))

[![](ben.png)](https://bendeivide.github.io/)

---

## Exemplos de *Websites*

Exemplos:
  - [R Markdown no RStudio](https://rmarkdown.rstudio.com/)
  - Website pessoal de [Rob J Hyndman](https://robjhyndman.com/)
  - Website pessoal de [Amber Thomas](https://amber.rbind.io)
  - Website pessoal de [Emi Tanaka](https://emitanaka.github.io)

---

## Exemplo de *Postcard*

- Exemplo: [Ben Dêivide](https://bendeivide.github.io/cursor/about.html)

---

## Exemplo de Dashboard

[![](midrangeMCP.png)](https://bendeivide.shinyapps.io/RDashboards/)

---

## Outros exemplos de Dashboards

- [eelloo](https://eelloo.nl/groepsrapportages-met-infographics/) 
- [Exemplo usando o `shiny`](https://jjallaire.shinyapps.io/shiny-crandash/)
- [Controle de gastos públicos](http://shiny.estatistica.ccet.ufrn.br/DashboardDeputados/)
- [Material para usar Dashboards + Shiny](https://pkgs.rstudio.com/flexdashboard/articles/examples.html)
  

---

## R Markdown: Relatórios programados

- Exemplo: [Mine Çetinkaya-Rundel](https://rmarkdown.rstudio.com/articles_mail_merge.html)

---

{{< slide background-image="/media/boards.jpg" >}}

## R Markdown: Relatórios programados (Aplicação)

- Nomes dos professores do DEFIM/UFSJ e númerode suas salas;
- Vamos fazer um documento em PDF, cujo nome desses arquivos serão os nomes dos professores, com algum texto identificando as suas salas.

![](rstudio.png)

---

## R Markdown: Livros

- Site: <https://bookdown.org/>
- Exemplo: [EPAEC](https://bendeivide.github.io/book-epaec/), [EAMBR](https://bendeivide.github.io/book-eambr/)

---

## R Markdown: Artigos e Teses

- Pacote `bookdown` (Tese)
- Pacote `rticles` (Artigo): `install.packages("rticles")`
- Pacote `thesisdown` (Tese):


```r
if (!require("remotes")) 
  install.packages("remotes", repos = "https://cran.rstudio.org")
remotes::install_github("rstudio/bookdown")
remotes::install_github("ismayc/thesisdown")
```

---

{{< slide background-image="/media/boards.jpg" >}}

## R Markdown: Livros (Aplicações)

![](rstudio.png)


---

{{< slide background-image="/media/boards.jpg" >}}

## R Markdown: Slides (Aplicações)

![](rstudio.png)

---

## Documentação para pacotes

- Pacote [`pkgdown`](https://pkgdown.r-lib.org/): ex.: [midrangeMCP](https://bendeivide.github.io/midrangeMCP/)
- Vignettes (Pacote [`usethis`](https://usethis.r-lib.org/)): `usethis::use_vignette()`

---

## Interface Gráfica ao Usuário 

- Exemplo do pacote `tcltk`: [`MCPtests`](https://bendeivide.github.io/project/mcptests/)

![](MCPtests.gif)

- Exemplo do pacote `shiny`: [`esquisse`](https://dreamrs.github.io/esquisse/)

---

## Documentos para aprendizagem do `R`

- Pacote [`learnr`](https://rstudio.github.io/learnr/index.html): ex.: [Estatística Experimental](http://bendeivide.shinyapps.io/Est_Exp/)

---

## Aplicação de provas (Academia)

- Pacote [`exams`](http://r-exams.org/) e uso no [MOODLE](https://moodle.org/)

![](rexams+moodle.png)

---

{{< slide background-image="/media/boards.jpg" >}}

## Gráficos 3D ($\LaTeX$ e `R`)

- Pacote `scatterplot3d`

---

{{< slide background-image="/media/boards.jpg" >}}

## Tabelas com ilustrações animadas + `Sweave`

![](rstudio.png)

---

## Onde publicamos esses materiais?

- [RPubs](https://rpubs.com/)
- [Como publicar!](https://rpubs.com/cathydatascience/518692)
- [shinyapp.io](https://www.shinyapps.io/)
- [Bookdown](https://bookdown.org/)
- [Servidor próprio](https://marcusnunes.me/posts/como-instalar-o-shiny-em-seu-proprio-servidor/)
- [Servidor online](https://gomesfellipe.github.io/post/2018-10-27-server-cloud/server-cloud/)
- [GitHub](http://https://github.com), [Rapidinhas do R 5 a 11](https://bendeivide.github.io/project/rapidinhasr/)
- [Netlify](https://www.netlify.com), [Como publicar!](https://bookdown.org/yihui/rmarkdown/blogdown-deploy.html)

---

# Questões?

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)
