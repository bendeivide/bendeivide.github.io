---
title: 📑 Modelo de Relatório
summary: "O propósito dessa página é auxiliar aos alunos a construção dos seus relatórios na disciplina Linguagem R na Ciência de Dados (DEFIM/CAP/UFSJ)"
date: "2026-03-27 08:16:55"
type: book
weight: 7
categories: ["Estatística", "Programação", "Ciência de Dados", "R"]
tags: ["Curso"]
draft: false
editor_options: 
  markdown: 
    wrap: 72
---

{{< toc hide_on="xl" >}}

## <i class="fas fa-chalkboard-teacher"></i> Apresentação {id="apresentacao" title="Clique aqui!"}

Material desenvolvido para que os alunos da disciplina Linguagem R na Ciência de Dados (LRCD) possam desenvolver seus relatórios estatísticos ou dinâmicos para a disciplina.

## <i class="fa fa-download" aria-hidden="true"></i> O que é necessário?

- [R](https://www.r-project.org/) e [RStudio](https://posit.co/download/rstudio-desktop/)
- [$\LaTeX$](https://www.latex-project.org/)
- [Quarto](https://quarto.org/)
- [Github](https://github.com/) 
- [LEEM](http://localhost:4321/project/leem/)

De forma mais detalhada recomendamos acessar este [link](https://bendeivide.github.io/relatorio-lrcd/relatorio/index.html#vis%C3%A3o-geral-sobre-os-relat%C3%B3rios).

## <i class="fas fa-pencil-alt" aria-hidden="true"></i> Como aprender cada uma das ferramentas necessárias?

- Para aprender sobre o [R](https://www.r-project.org/) e [RStudio](https://posit.co/download/rstudio-desktop/), recomendamos:
   - <i class="fas fa-video"></i> curso [EAR - R Básico](/courses/ear/index.html)
   - <i class="fa fa-book" aria-hidden="true"></i> [R Básico](/books/eambr01/index.html)
   - <i class="fab fa-youtube" aria-hidden="true"></i> [R Básico 2024](https://youtube.com/playlist?list=PL-20Z1XFWKR3E5zSS1Ke3pavrB53DV9NX&si=1l6tbB6hT8zqngEB)
   - <i class="fab fa-youtube" aria-hidden="true"></i> [R Básico 2023](https://youtube.com/playlist?list=PL-20Z1XFWKR1DVL3ue5yhGBWcH-XUH67r&si=O643FJU11nsbgGr6)
   - <i class="fab fa-youtube" aria-hidden="true"></i> [R Básico 2021](https://youtube.com/playlist?list=PL-20Z1XFWKR0y0qZdOM0KKqb4oEbAMs7O&si=1HRK2Z1GDM3UubjQ)
   - <i class="fab fa-youtube" aria-hidden="true"></i> [R Intermediário 2021](https://youtube.com/playlist?list=PL-20Z1XFWKR2K-rWoInwE1WnwtBiulX2S&si=SMWdzKFfeHTlb9DO)
   
- Para aprender sobre o [$\LaTeX$](https://www.latex-project.org/), recomendamos:
   - <i class="fas fa-video"></i> [Curso LaTeX](/courses/latex/index.html)
   - <i class="fa fa-book" aria-hidden="true"></i> [LaTeX: Um guia prático com aplicações na pesquisa e educação](/books/latex/index.html)
- Para aprender o [Quarto](https://quarto.org/), recomendamos acessar a sua própria página <https://quarto.org/>. Como alternativa, temos um curso usando o Quarto para a criação de livros, que pode auxiliar no seu uso, como também o Curso Documentações em R. Acesse: [Quarto livros](/courses/qlivros/index.html) e [Documentações em R](/courses/docr/index.html)
- Para aprender a usar o [Github](https://github.com/), recomendamos fortemente enteder a noção básica sobre o [Git](https://git-scm.com/). Acesse o [manual](https://git-scm.com/book/en/v2)
- Para aprender o [LEEM](http://localhost:4321/project/leem/), acesse:
  - <i class="fab fa-youtube" aria-hidden="true"></i> [Use leem](https://youtube.com/playlist?list=PL-20Z1XFWKR0NaBzcRbt3Rjq_2TTUOPK1&si=ReW7BRmwBEbEEUlN)
  - <i class="fab fa-youtube" aria-hidden="true"></i> [Curso do pacote leem](https://www.youtube.com/playlist?list=PL-20Z1XFWKR2FCUNnCm6WPuqYN2c9IvdJ)
  

## <i class="fab fa-youtube" aria-hidden="true"></i> Videoaulas com o passo a passo

Os dois primeiros vídeos foram usados quando ministramos a disciplina [MA 41 no Profmat](https://bendeivide.github.io/courses/profmat-probest/). Na época, usamos o projeto do relatório baseado no modelo <https://bendeivide.github.io/profmatma41/>. Para a disciplina LRCD, usaremos o projeto <https://bendeivide.github.io/relatorio-lrcd/>.

Seguem os dois primeiros vídeos:

{{< spoiler text="📹 Relatórios para páginas web (R & GitHub)">}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/sY4eo3eUR-c?si=uZW08Zcngz9KvFUH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{{</spoiler>}}


{{< spoiler text="📹 Relatórios para páginas web (R & GitHub) - Parte II">}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/nhh323kMWqo?si=pmfv3iZMuzUN4dxo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{{</spoiler>}}

Para a melhoria de como desenvolver esses relatórios, resolvemos acrescentar mais 4 vídeos reapresentando de forma simplificada o que os vídeos anteriores mostraram. Seguem:

{{< spoiler text="📹 Relatório via web | Aula 01 - Baixar o projeto R/RStudio">}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/z3iAahE3xIg?si=jGkVoRJ0A4VS7ioh" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{{</spoiler>}}

{{< spoiler text="📹 Relatório via web | Aula 02 - Subindo o projeto do relatório ao servidor Github">}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/r4yaBUJbCVc?si=YKd3K5wpfoVuAid8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{{</spoiler>}}

{{< spoiler text="📹 Relatório via web | Aula 03 - Alterações no projeto Git/Rstudio">}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/ez8ThgOvplc?si=QCwrn83bwKmA1-SR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{{</spoiler>}}

{{< spoiler text="📹 Relatório via web | Aula 04 - Trabalho Github/RStudio colaborativo">}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/BTolFm3UlEE?si=7Ejnvq8yesFiNF-r" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{{</spoiler>}}



## <i class="fab fa-github" aria-hidden="true"></i> Onde encontrar o projeto base? {id="onde" title="Clique aqui!"}

Segue o [link](https://github.com/bendeivide/relatorio-lrcd). Seguindo os passos dos dois vídeos informados anteriormente, será possível a criação do modelo de relatório.



