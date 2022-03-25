---
title: Estatística e Probabilidade
summary: Aula 02
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
Aula 02 - Definições gerais e técnicas de somatório
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


<!-- https://revealjs.com/transitions/ -->
<section data-transition="zoom">
  <h2>Introdução</h2>
  <p> Nossa vida atual é assim hoje ... </p>
  {{< figure src="programador.png" title="Imagens: gratispng.com" width="530" height="380" >}}
  
</section>

<section data-transition-speed="fast">
<h2>Introdução</h2>
<p> Nossa vida atual é assim hoje ... </p>
{{< figure src="dados.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h2>Introdução</h2>
<p> Usamos para tudo ... </p>
{{< figure src="emojis.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h2>Introdução</h2>
<p> Pesquisar ... </p>
{{< figure src="searching.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h2>Introdução</h2>
<p> Contratempos ... </p>
{{< figure src="quebrando_pc.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

---

{{< slide background-image="cap02.png" >}}


<!-- https://revealjs.com/transitions/ -->
<section data-transition="zoom">
  <h2>Dados</h2>
  <p> Em meio a tudo isso, uma coisa acontece ... </p>
  {{< figure src="dados02.png" title="Imagens: gratispng.com" width="530" height="380" >}}
  
</section>

<section data-transition-speed="fast">
<h2>Dados</h2>
<p> Essas informações são processadas ... </p>
{{< figure src="infra_comp.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h2>Dados</h2>
<p> Analisadas ... </p>
{{< figure src="exp_user.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h2>Dados</h2>
<p> E assim, todos esses dados ... </p>
{{< figure src="analise02.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h2>Dados</h2>
<p> ... que os usuários repassam ... </p>
{{< figure src="analise03.png" title="Imagens: gratispng.com" width="530" height="380" >}}

</section>

<section data-transition-speed="fast">
<h1>Dados > \$</h1>

</section>



<section data-transition-speed="fast">
<h2>Dados</h2>
<p> E aí, o Vale do silício é o que tem que ser! </p>
{{< figure src="vale_silicio.jpg" title="Imagens: oficinadanet.com.br" width="530" height="380" >}}

</section>

---

{{< slide background-image="cap02.png" >}}


<!-- https://revealjs.com/transitions/ -->
<section data-transition="zoom">
  <h2>Motivação inicial </h2>
  <p> Definições gerais da estatística (Exemplo do livro EPAEC) </p>
  {{< figure src="epaec_exerc5.19.png" title="" width="830" height="420" >}}
  
</section>

<section data-transition-speed="fast">
<h2>Motivação inicial</h2>
<p> Definições gerais da estatística... </p>
{{< figure src="prodcons.png" title="Imagem: Livro EPAEC" width="530" height="380" >}}

</section>

---

{{< slide background-image="cap02.png" >}}

## Método Científico

<iframe width="760" height="515" src="https://www.youtube.com/embed/QPeS1v7l6yk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

{{< slide background-image="cap02.png" >}}


<!-- https://revealjs.com/transitions/ -->
<section data-transition="zoom">
  <h2>Definições Gerais da Estatística</h2>
  <aside class="notes">
    📝 Mostrar a relação do Método científico com as Definições gerais da estatística (Smoothdraw)
  </aside>
  <iframe width="760" height="515" src="https://www.youtube.com/embed/mASLUwyaC5Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</section>

<section data-transition-speed="fast">
<h2>Definições Gerais da Estatística</h2>
<aside class="notes">
    📝 Mostrar a relação do Método científico com as Definições gerais da estatística (Smoothdraw)
  </aside>
<iframe width="760" height="515" src="https://www.youtube.com/embed/xvORKHMVUr8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</section>

---

## Natureza das variáveis

<iframe width="760" height="515" src="https://www.youtube.com/embed/LIg6uLzCRmU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

{{< slide background-image="cap02.png" >}}

## Técnicas de Somatório

  <aside class="notes">
    📝 Fazer alguns exemplos na sala digital (Smoothdraw)
  </aside>

<iframe width="760" height="515" src="https://www.youtube.com/embed/tWCxCyZZHes" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


---

{{< slide background-image="cap02.png" >}}

# Questões? 

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)

---

{{< slide background-image="cap02.png" >}}
<!-- https://revealjs.com/transitions/ -->
<section data-transition="zoom">
  <h2>Próximas aulas...</h2>
</section>

<section data-transition-speed="fast">

[{{< figure src="ben05.png" title="bendeivide.github.io" width="630" height="480" >}}](/courses/epaec/)

</section>

<!-- <section> -->
<!--   <h2>Some Slide</h2> -->

<!--   <aside class="notes"> -->
<!--     Anotações no Visualizador (Clique em S) 📝 -->
<!--   </aside> -->
<!-- </section> -->


<!-- ## Animação -->

<!-- <section data-auto-animate> -->
<!--   <h2>Auto-Animate</h2> -->
<!-- </section> -->
<!-- <section data-auto-animate> -->
<!--   <h2 style="margin-top: 100px; color: red;">Auto-Animate</h2> -->
<!-- </section> -->
