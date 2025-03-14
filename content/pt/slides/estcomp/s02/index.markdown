---
title: Estatística Computacional
summary: Aula 02
authors: [Ben Dêivide]
tags: [Estatística Computacional, Ambiente R, Programação]
categories: [Curso]
slides:
# Choose a theme from https://github.com/hakimel/reveal.js#theming
# https://revealjs.com/themes/
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

{{< slide background-image="fundo03.jpg" >}}

# Estatística Computacional
Aula 02 - Introdução ao ambiente R
</br>


{{< icon name="user-tie" pack="fas" >}} [Ben Dêivide](https://bendeivide.github.io/) | {{< icon name="school" pack="fas" >}} [UFSJ](https://www.ufsj.edu.br/)
</br>
{{< icon name="book" pack="fas" >}} [Estatística Computacional]({{< relref "/courses/estcomp" >}})


---

{{< slide background-image="fundo02.png" >}}

## Selo DC

[![](SeloDC-branco.png)](https://bendeivide.github.io/dc/)

---

{{< slide background-image="fundo02.png" >}}

## Acesso a todo material

[![](folder.png)]({{< relref "/courses/estcomp" >}})

---

{{< slide background-image="fundo02.png" >}}

## Instalação do R e RStudio

- [SO Win](https://bendeivide.github.io/cursor/#so-windows)
- [SO UNIX](https://bendeivide.github.io/cursor/#so-linux-ubuntu)
- [SO MAC](https://bendeivide.github.io/cursor/#so-mac)

---

{{< slide background-image="fundo02.png" >}}


<!-- https://revealjs.com/transitions/ -->
<section data-transition="zoom">
  <h2>Diferença entre o R e RStudio</h2>
  {{< figure src="promptr.png" title="" width="730" height="380" >}}
  
</section>

<section data-transition-speed="fast">
<h2>Diferença entre o R e RStudio</h2>
{{< figure src="ide_rstudio.png" title="" width="730" height="380" >}}

</section>

---

{{< slide background-image="fundo02.png" >}}

## Como o R trabalha

{{< figure src="rworks.png" title="" width="730" height="480" >}}

---

{{< slide background-image="fundo02.png" >}}

<section data-auto-animate>
  <h2 data-id="code-title">Console e Prompt de comando</h2>
	<pre data-id="code-animation">
	  <code class="hljs" data-trim data-line-numbers="|1|2-3">
	    <script type="text/template">
        options(prompt = "R> ")
        # Toda vez que o console iniciar, começarar por 'R>'
        10
	    </script>
	  </code>
	</pre>
</section>

<section>
<h2 data-id="code-title">Resultado da execução</h2>


```r
R> options(prompt = "R> ")
R> # Toda vez que o console iniciar, começarar por 'R>'
R> 10
```

```
## [1] 10
```
</section>

---

<section>
<h2> Comandos elementares </h2>


```r
10 + 15
```

```
## [1] 25
```
</br>


```r
10,5 + 15,5
```

```
## Error: <text>:1:3: ',' inesperado
## 1: 10,
##       ^
```

</section>

<section>

<h2> Comandos elementares </h2>


```r
# Foi criado um objeto do tipo caractere e o nome "meu_nome" foi associado a ele
# O 'R' avalia essa expressão, mas não imprime no console!
meu_nome <- "Ben"

# Para imprimir o resultado da expressão, digitamos o nome "meu_nome" no console
# e apertamos o botão ENTER do teclado!
meu_nome
```

```
## [1] "Ben"
```

</section>

<section>

<h2> Nomes e objetos </h2>

- Deve consistir em letras, dígitos, `.` e `_`;
- Os nomes devem ser iniciado por uma letra ou um ponto não seguido de um número, isto é, Ex.: `.123`, `1n`, dentre outros;
- As letras maiúsculas se distinguem das letras minúsculas;


</section>

<section>

- Não pode inicia por `_` ou dígito, é retornado um erro no console caso isso ocorra;
- Não pode usar qualquer uma das palavras reservadas pela linguagem, isto é, `TRUE`, `FALSE`, `if`, `for`, dentre outras, que pode ser consultado usando o comando `?Reserved()`.

</section>

<section>

<h2> Nomes não sintáticos  </h2>


```r
# Nome nao sintatico
.123 <- 50
## Error in 0.123 <- 50 : lado esquerdo da atribuicao inválida (do_set)

# Qual a sugestao de nome sintatico para '.123'?
make.names(.123)
[1] "X0.123"
```

</section>

---

<section>
<h2> Correção de comandos no R </h2>

<iframe width="560" height="315" src="https://www.youtube.com/embed/0MRPmVsPvk4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</section>

<section>
<h2> Correção de comandos no RStudio </h2>

<iframe width="560" height="315" src="https://www.youtube.com/embed/KL3WAB_GFNI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</section>

---

{{< slide background-image="fundo02.png" >}}

<section data-auto-animate>
  <h2 data-id="code-title">Ambiente global</h2>
	<pre data-id="code-animation">
	  <code class="hljs" data-trim data-line-numbers="|4">
	    <script type="text/template">
       # Nomes criados no ambiente 
       x <- 10 - 6; y <- 10 + 4; w <- "Maria Isabel"
       # Verificando o nomes contidos no ambiente global
       ls()
	    </script>
	  </code>
	</pre>
	

```
## [1] "meu_nome" "w"        "x"        "y"
```
	
</section>


---

{{< slide background-image="fundo02.png" >}}

## Criando e salvando um script

<iframe width="560" height="315" src="https://www.youtube.com/embed/ETreeG5HK60" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

<section>
<h2> Objetos </h2>

<iframe width="560" height="315" src="https://www.youtube.com/embed/6t9h9zgWyTE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</section>

<section data-auto-animate>
<h2> Entendimento dos nomes e objetos </h2>
	<pre data-id="code-animation">
	  <code class="hljs" data-trim data-line-numbers="|2;5|3;6">
	    <script type="text/template">
       x <- 10
       lobstr::obj_addr(x)
       ## [1] "0xf8a104fc20"
       y <- x
       lobstr::obj_addr(y)
       ## [1] "0xf8a104fc20"
	    </script>
	  </code>
	</pre>
</section>

<section>

<h2> Ilustração </h2>

{{< figure src="y=x=10.png" title="" width="730" height="380" >}}

</section>

<section>

<h2> Objeto e Ambiente </h2>

{{< figure src="objamb.png" title="" width="730" height="380" >}}

</section>

<section>

<h2> Para um melhor entendimento sobre objetos </h2>

<https://bendeivide.github.io/cursor/nbasico#objetos>

</section>

---

<section>
<h2> Importação de dados </h2>

<h3> Importação de dados </h3>

{{< figure src="banco_dados.png" title="" width="730" height="380" >}}


</section>

<section>

<h3> Importação com o RStudio </h3>

{{< figure src="imp-exp.png" title="" width="730" height="380" >}}


</section>

<section>

<h3> Importação com o RStudio </h3>

{{< figure src="imp-exp2.png" title="" width="730" height="380" >}}


</section>

<section>

<h3> Importação com o RStudio </h3>

{{< figure src="imp-exp3.png" title="" width="730" height="380" >}}


</section>

<section>

<h3> Importação com o RStudio </h3>

{{< figure src="imp-exp4.png" title="" width="730" height="380" >}}


</section>

---

{{< slide background-image="fundo02.png" >}}

# Questões?

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)
