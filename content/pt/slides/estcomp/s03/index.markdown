---
title: Estatística Computacional
summary: Aula 03
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
Aula 03 - Objetos em R
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

## Introdução

John Chambers (Criador da linguagem S) afirma:

> **Princípio do Objeto**: Tudo que existe em `R` é um objeto

- Definimos um objeto como uma entidade no ambiente `R` com características internas contendo informações necessárias para interpretar sua estrutura e conteúdo
  - Atributos
  - Atributos intrínsecos: **modo** e **comprimento**
  
---

{{< slide background-image="fundo02.png" >}}

## Associando o nome a um objeto


```r
> x <- 10
```
- Comandos de atribuição
- Use: `<-`, isto é, `<` + `-`
- Evite: `=`, use apenas para definir argumentos em uma função
- Nomes sintáticos e nomes não sintáticos;

---

{{< slide background-image="fundo02.png" >}}

<section>
<h2>Nomes sintáticos e não sintáticos</h2>

<ul>
<li class="fragment" data-fragment-index="3">

Deve consistir em letras, dígitos, `.` e `_` ; 

</li>
<li class="fragment" data-fragment-index="1">

Os nomes devem ser iniciado por uma letra ou um ponto não seguido de um número, Ex.: `.123`;

</li>
<li class="fragment" data-fragment-index="2">

Letras maiúsculas e minúsculas são diferentes;

</li>
<li class="fragment" data-fragment-index="5">

Não pode inicia por `_` ou dígito;

</li>

<li class="fragment" data-fragment-index="4">

Não pode usar palavras reservadas: `?Reserved()`. 

</li>
</ul>

</section>

<section>
<h2>Nomes sintáticos e não sintáticos</h2>


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

{{< slide background-image="fundo02.png" >}}

<section>
<h2>Associando um nome ao objeto</h2>



```r
> x <- 10 # Ou 10 -> x
```

<img src="x=10.png" width="60%" style="display: block; margin: auto;" />


```r
> lobstr::obj_addr(x)
> # [1] "0xf8a104fc20"
```

</section>
<section>
<h2>Associando um nome ao objeto</h2>


```r
> y <- x
> lobstr::obj_addr(y)
> # [1] "0xf8a104fc20"
```

<img src="y=x=10.png" width="60%" style="display: block; margin: auto;" />

</section>
<section>
<h2>Associando um nome ao objeto e ambiente global</h2>

<img src="objamb.png" width="60%" style="display: block; margin: auto;" />

</section>
<section>
<h2>Associando um nome ao objeto</h2>


```r
> lobstr::obj_addr(x)
> # [1] "0xf8a104fc20"
> x <- 30
> lobstr::obj_addr(x)
> # [1] "0x42db6dbb50"
```

</section>

---

{{< slide background-image="fundo02.png" >}}

## Atributos e Classes 

- atributos intrínsecos:
  - **modo**: 
    - `mode()` baseado na linguagem `S` e      
    - `typeof()` baseado na linguagem `C`
  - **comprimento**: `length()`
- Demais atributos: `attributes()`
- Classe: `class()` e `sloop::s3_class()` e atributo classe por `attributes()`

---

{{< slide background-image="fundo02.png" >}}

<section>
<h2>Atributo intrínseco de modo (Vetores)</h2>


```r
> # Objeto modo caractere
> x <- "Ben"; mode(x)
```

```
## [1] "character"
```

```r
> # Objeto modo logico
> z <- TRUE; mode(z)
```

```
## [1] "logical"
```

```r
> # Objeto modo complexo
> w <- 1i; mode(w)
```

```
## [1] "complex"
```

</section>

<section>
<h2>Atributo intrínseco de modo (Vetores)</h2>


```r
> # Objeto modo numerico
> y <- 10L; mode(y); y2 <- 10; mode(y2)
```

```
## [1] "numeric"
```

```
## [1] "numeric"
```

```r
> # y eh igual a y2? # y eh identico y2?
> y == y2; identical(y, y2)
```

```
## [1] TRUE
```

```
## [1] FALSE
```

</section>

<section>
<h2>Atributo intrínseco de modo (Vetores)</h2>


```r
> # Objeto modo caractere
> x <- "Ben"; typeof(x)
```

```
## [1] "character"
```

```r
> # Objeto modo logico
> z <- TRUE; typeof(z)
```

```
## [1] "logical"
```

```r
> # Objeto modo complexo
> w <- 1i; typeof(w)
```

```
## [1] "complex"
```

</section>

<section>
<h2>Atributo intrínseco de modo (Vetores)</h2>


```r
> # Objeto modo numerico
> y <- 10L; typeof(y); y2 <- 10; typeof(y2)
```

```
## [1] "integer"
```

```
## [1] "double"
```

```r
> # y eh igual a y2? # y eh identico y2?
> y == y2; identical(y, y2)
```

```
## [1] TRUE
```

```
## [1] FALSE
```

</section>

---

{{< slide background-image="fundo02.png" >}}

## Resumo do modo em vetores atômicos

| `typeof`  | `mode` |
|:---------:|:------:|
| `logical` | `logical` |
| `integer` | `numeric` |
| `double`  | `numeric` |
| `complex` | `complex` |
| `character` | `character` |
| `raw`     |  `raw`  |


---

{{< slide background-image="fundo02.png" >}}

<section>
<h2>Comprimento</h2>


```r
> # Vetor de comprimento 5
> v1 <- 1:5
> # Vetor de comprimento 3
> v2 <- c("Ben", "Maria", "Lana")
> # Vetor de comprimento quatro
> v3 <- c(TRUE, FALSE, TRUE, TRUE)
> # Vejamos o comprimento dos vetores
> length(v1); length(v2); length(v3)
```

```
## [1] 5
```

```
## [1] 3
```

```
## [1] 4
```

</section>
<section>
<h2>Comprimento</h2>

![](v1v2v3.png)

</section>


---

{{< slide background-image="fundo02.png" >}}

## Resumo

Um resumo as funções mensionadas podem ser refletidas com as seguintes indagações:

- `base::class()` e `loop::c3_class()`:  Qual o tipo de objeto?
- `base::mode()`: Qual o tipo de dados baseados na linguagem `S`?
- `base::typeof()`: Qual o tipo de dados baseados na linguagem `C`?
- `base::attributes()`: O objeto tem atributos?
- `base::length()`: Qual o comprimento do objeto?

Sintaxe: `pacote::nome_função()`

---

{{< slide background-image="fundo02.png" >}}

## Classes

- Objetos que armazenam "dados", pensando em análises:
  - `numeric`
  - `logical`
  - `character`
  - `list`
  - `matrix`
  - `array`
  - `factor`
  - `data.frame`
  
---

{{< slide background-image="fundo02.png" >}}

<section>
<h2>Coersão do R</h2>


```r
> # Criando um objeto x e imprimindo o seu resultado
> x <- c("Nome", 3, 4, 5);x
```

```
## [1] "Nome" "3"    "4"    "5"
```

<img src="coersao.png" width="30%" style="display: block; margin: auto;" />
</section>
<section>
<h2>Coersão imposta pelo usuário</h2>


```r
> # Objeto de modo numerico
> minha_idade <- 35; mode(minha_idade)
```

```
## [1] "numeric"
```

```r
> # Coersão do objeto para modo caractere (`string`)
> minha_idade <- as.character(minha_idade) 
> mode(minha_idade)
```

```
## [1] "character"
```

```r
> # Verificando se o objeto tem modo 'character'
> is.character(minha_idade)
```

```
## [1] TRUE
```

</section>

---

{{< slide background-image="fundo02.png" >}}

<section>
<h2>Tipo de objetos</h2>

- Vetores atômicos:
  - Lógicos, Numéricos e Caracteres;
  - Matrizes unidimensionais (*Matrix*) e multidimensionais (*Arrays*);
  
- Vetores em listas:
  - Listas (*Lists*);
  - Quadro de dados (*Data frames*);
  
Existem outros, mas para esse módulo, exploraremos estes nas seções seguintes

</section>

---

{{< slide background-image="fundo02.png" >}}

# Questões?

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)
