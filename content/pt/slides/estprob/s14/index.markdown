---
title: Estatística e Probabilidade
summary: Aula 14
authors: [Ben Dêivide]
tags: [Estatística e Probabilidade, Ambiente R, Programação]
categories: [Curso]
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
# https://github.com/rstudio/revealjs
# Esse componente serve apenas para os temas oficiais
  theme: 'solarized'
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




{{< slide background-image="cap.png" >}}

# Estatística e Probabilidade
Aula 14 - Variáveis aleatórias e Distribuições de probabilidades discretas
</br>

{{< icon name="user-tie" pack="fas" >}} [Ben Dêivide](https://bendeivide.github.io/) | {{< icon name="school" pack="fas" >}} [UFSJ](https://www.ufsj.edu.br/)
</br>
{{< icon name="book" pack="fas" >}} [Estatística e Probabilidade]({{< relref "/courses/epaec" >}})


---

{{< slide background-image="cap02.png" >}}

## Selo DC

[![](SeloDC-preto.png)](https://bendeivide.github.io/dc/)

---

{{< slide background-image="cap02.png" >}}

## Motivação

<div id="" class="exemplo" cap=5 titulo="">
Para explicar a definição de uma variável aleatória será considerado o exemplo, no qual duas variedades de uma espécie $ A $ ( $ A_1 $, $ A_2 $ ) e três de outra espécie $ E $ ( $ E_1 $, $ E_2 $ e $ E_3 $ ) são disponibilizados para uma pesquisa. Uma amostra de duas variedades ($ n=2 $) é extraída. O espaço amostral dos resultados desse experimento, segue,

`\begin{aligned}
\Omega =  \{(A_1,A_2), (A_1,E_1), (A_1,E_2), (A_1,E_3), (A_2,E_1), (A_2,E_2), (A_2,E_3), (E_1,E_2),  (E_1,E_3), (E_2,E_3) \}
\end{aligned}`


</div>


---

{{< slide background-image="cap02.png" >}}

## Experimento 1

<div class="r-stack">
  <img class="fragment fade-in-then-out" src="binom1.png" data-fragment-index="1" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom2.png" data-fragment-index="2" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom3.png"  data-fragment-index="3" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom4.png" data-fragment-index="4" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom5.png" data-fragment-index="5" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom6.png"  data-fragment-index="6" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom7.png" data-fragment-index="7" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom8.png" data-fragment-index="8" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom9.png" data-fragment-index="9" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom10.png" data-fragment-index="10" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom11.png" data-fragment-index="11" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom12.png" data-fragment-index="12" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom13.png" data-fragment-index="13" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom14.png" data-fragment-index="14" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom15.png" data-fragment-index="15" width="650" height="500">
  <img class="fragment fade-in-then-out" src="binom16.png"  data-fragment-index="16" width="650" height="500">
  <img class="fragment current-visible" src="binom17.png" data-fragment-index="17" width="650" height="500">
  <img class="fragment" src="binom18.png" width="650" height="500">
</div>


---

{{< slide background-image="cap02.png" >}}

# Questões? 

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)

