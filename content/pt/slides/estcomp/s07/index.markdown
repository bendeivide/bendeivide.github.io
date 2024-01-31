---
title: Estatística Computacional
summary: Aula 07
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
Aula 07 - Introdução ao Markdown no R
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

<section>

<h2> Introdução ao Markdown </h2>

- Markdown é uma ferramenta de conversão de texto para HTML para escritores da web ([John Gruber](https://daringfireball.net/projects/markdown/))
- Objetivo: `Markdown => HTML`
- Criador: [John Gruber](https://daringfireball.net/projects/markdown/), em 2004
</section>
<section>
<h2> Introdução ao Markdown </h2>

- A ideia do Markdown:
  - Texto de escrita simples
  - Ferramenta escrita na linguagem `Perl`, que converte o código para `HTML`
  - extensão do arquivo: `.md` ou `.markdown`

</section>
<section>
<h2> Introdução ao Markdown </h2>

A ideia da linguagem de marcação é:

- Escrito em `HTML`:

```html
<p>Este é um parágrafo com uma palavra em <b>negrito</b> e outra em <i>itálico</i>.</p>
```
- Escrito em `Markdown`:
```markdown
Este é um parágrafo com uma palavra em **negrito** e outra em *itálico*.
```
- Renderização:

Este é um parágrafo com uma palavra em **negrito** e outra em *itálico*.

</section>

  
---

{{< slide background-image="fundo02.png" >}}

<style>
.container{
  display: grid;
  text-align: left;
  grid-auto-flow: column;
}
</style>

<section>
<h1> Sintaxe </h1>

----

<h2> Criando Seções </h2>

<div class="container">

<div class="col">

```markdown
# Seção 1
## Subseção 1
### Subsubseção 1
#### Subsubsubseção 2
##### ...
```

</div>

<div class="col">


# Seção 1
## Subseção 1
### Subsubseção 1
#### Subsubsubseção 2
##### ...



</div>

</div>

----

<h2> Outra forma </h2>

<div class="container">

<div class="col">

```markdown
Seção 1
========

Subseção 1
----------
```

</div>

<div class="col">

Título 1
========

Título 2
--------

</div>

</div>

----

<h2> Texto </h2>
<div class="container">
<div class="col">

```markdown
Texto em **negrito**!\
Texto em __negrito__!\
Texto em *itálico*\
Texto em _itálico_ \
Texto ~~taxado~~
```

</div>

<div class="col">

Texto em **negrito**!\
Texto em __negrito__!\
Texto em *itálico*!\
Texto em _itálico_ \
Texto ~~taxado~~ \

</div>

</div>

----

<h2> Parágrafos </h2>


<div class="container">

<div class="col">

```markdown
Texto do primeiro parágrafo. \
Texto do segundo parágrafo.

Ou ainda o parágrafo pode 
ser separado acrescentando 
dois espaços na última linha

```

</div>

<div class="col">

Texto do primeiro parágrafo. \
Texto do segundo parágrafo.

Ou ainda o parágrafo pode 
ser separado acrescentando 
dois espaços na última linha

</div>

</div>

----

<h2> Listas não ordenadas </h2>

<div class="container">

<div class="col">

```markdown
- Primeiro item da lista 1
- Segundo item da lista 1

+ Primeiro item da lista 2
+ Segundo item da lista 2

* Primeiro item da lista 3
* Segundo item da lista 3
```

</div>

<div class="col">

- Primeiro item da lista 1
- Segundo item da lista 1

+ Primeiro item da lista 2
+ Segundo item da lista 2

* Primeiro item da lista 3
* Segundo item da lista 3

</div>

</div>

----

<h2> Listas com checagem </h2>
<div class="container">
<div class="col">

```markdown
- [X] Primeiro OK!
- [ ] Segundo pendente
- [ ] Segundo também


```

</div>

<div class="col">

- [X] Primeiro OK!
- [ ] Segundo pendente
- [ ] Segundo também

</div>

</div>

----

<h2> Listas e sublistas não ordenadas </h2>
<div class="container">
<div class="col">

```markdown
- Lista 1
  - Sublista 1.1
  - Sublista 1.2
    - Subsublista 1.2.1
- Lista 2
  - Sublista 2.1
  - Sublista 2.2
    - Subsublista 2.2.1
```

</div>

<div class="col">

- Lista 1
  - Sublista 1.1
  - Sublista 1.2
    - Subsublista 1.2.1
- Lista 2
  - Sublista 2.1
  - Sublista 2.2
    - Subsublista 2.2.1
    
</div>

</div>

----

<h2> Listas ordenadas </h2>
<div class="container">
<div class="col">

```markdown
1. Primeiro 
2. Segundo 
3. Terceiro
```

</div>

<div class="col">

1. Primeiro 
2. Segundo 
3. Terceiro
    
</div>

</div>

----

<h2> Citações </h2>
<div class="container">
<div class="col">

```markdown
> Citação em nível 1
>> Citação em nível 2
>>> Citação em nível 3
```

</div>

<div class="col">

> Citação em nível 1
>> Citação em nível 2
>>> Citação em nível 3

</div>

</div>

----

<h2>Linhas horizontais</h2>

Três ou quatro traços (ou asteriscos), formam uma linha:

```markdown
Primeira linha:

----

Segunda Linha:

****
```

----

<h2> Links </h2>
<div class="container">
<div class="col">

```markdown
- [Ben Dêivide](https://bendeivide.github.io/)
- Outra forma: [Ben Dêivide][link01]

   [link01]: https://bendeivide.github.io/
   
- Outra forma: [Ben Dêivide]

   [Ben Dêivide]: https://bendeivide.github.io/
   
```

</div>

<div class="col">

- [Ben Dêivide](https://bendeivide.github.io/)

- Outra forma: [Ben Dêivide][link01]
   
   [link01]: https://bendeivide.github.io/
   
- Outra forma: [Ben Dêivide]

   [Ben Dêivide]: https://bendeivide.github.io/
    
</div>

</div>

----

<h2> Imagem sem Nome </h2>
<div class="container">
<div class="col">

```markdown

![](./imagens/rstudio.png)
   
```

</div>

<div class="col">

![](rstudio.png)


</div>

</div>

----

<h2> Imagem com Nome </h2>
<div class="container">
<div class="col">

```markdown

![](./imagens/rstudio.png "IDE RStudio")
   
```

</div>

<div class="col">

![](rstudio.png "IDE RStudio")


</div>

----

<h2> Imagem estilo de referênica </h2>
<div class="container">
<div class="col">

```markdown

![][rstudio]

  [rstudio]: ./imagens/rstudio.png "IDE RStudio"
   
```

</div>

<div class="col">

![][rstudio]

  [rstudio]: rstudio.png "IDE RStudio"


</div>

</div>

----

<h2> Códigos </h2>
<div class="container">
<div class="col">

````markdown

```python
print('Ola, Mundo!')
```

```r
print('Ola, Mundo!')
```

```html
<p> Isso está em <i>negrito</i> ! </p>
```

````

</div>

<div class="col">

- Código `python`:

```python
print('Ola, Mundo!')
```

- Código `R`:

```r
print('Ola, Mundo!')
```

- Código `html`:

```html
<p> Isso está em <i>negrito</i> ! </p>
```


</div>

</div>

----

<h2> Tabelas </h2>
<div class="container">
<div class="col">

```markdown

| Col1     | Col2     |   Col3   |
|:---------|:--------:|---------:|
| Direita  | centro   | esquerda |
| B        |     D    |        F |

   
```

</div>

<div class="col">

<style type="text/css">
.tg  {border-collapse:collapse;border-color:#93a1a1;border-spacing:0;}
.tg td{background-color:#fdf6e3;border-bottom-width:1px;border-color:#93a1a1;border-style:solid;border-top-width:1px;
  border-width:0px;color:#002b36;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:13px 13px;
  word-break:normal;}
.tg th{background-color:#657b83;border-bottom-width:1px;border-color:#93a1a1;border-style:solid;border-top-width:1px;
  border-width:0px;color:#fdf6e3;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;
  padding:13px 13px;word-break:normal;}
.tg .tg-z4i2{border-color:#ffffff;text-align:left;vertical-align:middle}
.tg .tg-wl5s{background-color:#eee8d5;border-color:#ffffff;text-align:left;vertical-align:middle}
.tg .tg-i2ob{background-color:#eee8d5;border-color:#ffffff;text-align:right;vertical-align:middle}
.tg .tg-44qx{border-color:#ffffff;font-weight:bold;text-align:center;vertical-align:middle}
.tg .tg-0w69{border-color:#ffffff;text-align:right;vertical-align:middle}
.tg .tg-2eyt{border-color:#ffffff;font-weight:bold;text-align:left;vertical-align:middle}
.tg .tg-ung0{border-color:#ffffff;font-weight:bold;text-align:right;vertical-align:middle}
.tg .tg-ttci{background-color:#eee8d5;border-color:#ffffff;text-align:center;vertical-align:middle}
.tg .tg-v0mg{border-color:#ffffff;text-align:center;vertical-align:middle}
</style>
<table class="tg">
<thead>
  <tr>
    <th class="tg-2eyt">Col1</th>
    <th class="tg-44qx">Col2</th>
    <th class="tg-ung0">Col3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-wl5s">Direita</td>
    <td class="tg-ttci">centro</td>
    <td class="tg-i2ob">esquerda</td>
  </tr>
  <tr>
    <td class="tg-z4i2">B</td>
    <td class="tg-v0mg">D</td>
    <td class="tg-0w69">F</td>
  </tr>
</tbody>
</table>


</div>

</div>


</section>



---

{{< slide background-image="fundo02.png" >}}

# Questões?

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)
