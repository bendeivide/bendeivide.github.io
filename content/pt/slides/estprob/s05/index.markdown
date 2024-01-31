---
title: "Estatística e Probabilidade"
subtitle: "Aula 05 - Medidas de posição"
title-slide-attributes:
    data-background-image: cap.png

author: "{{< fa user-tie >}} [Ben Dêivide](http://bendeivide.github.io) | {{< fa school >}} [UFSJ](https://www.ufsj.edu.br/)"
bibliography: biblio.bib
link-citations: true
csl: associacao-brasileira-de-normas-tecnicas-ipea.csl
lang: "pt-br"
format: 
  revealjs:
    navigation-mode: vertical # Slides horizontais e verticais
    theme: [dark, ben-slide.scss]
    transition: slide
    background-transition: fade
#    transition-speed: fade
    footer: "[EPAEC](https://bendeivide.github.io/courses/epaec/) | <https://bendeivide.github.io/>" # Rodapé
    incremental: true # Transição de itens gradativos
    controls: true # Inserindo as flechas de transicao
    # Quadro negro
    chalkboard: 
      theme: whiteboard
      #chalk-width: 5 # largura da caneta do quadro negro
      boardmarker-width: 3 # largura da caneta do quadro branco
    multiplex: true # Efeito para quando eu mudar o slide, todos observarao mudando em seus browsers tbm
    logo: ben.png
#   slide-tone: true # som na transicao dos slides
    slide-number: true # Inserindo numero nos slides
#    show-slide-number: print
    menu:
      side: left # lado do menu
      width: wide
#     numbers: true # inserir numero nos itens do menu
    pointer: # Plugin para o ponteiro
      - key: q
      - color: red
      - pointerSize: 16
      - alwaysVisible: false
revealjs-plugins:
  - pointer
editor: source
---

# Filosofia de publicação (Selo DC)

<a href="https://bendeivide.github.io/dc/" target="_blank" style="text-align: center;">

<img src="SeloDC-branco.png" width = "400">

</a>

# Livro de Apoio

Usaremos Batista ([2023](#ref-batista2023)):

<a href="https://bendeivide.github.io/books/epaec/" target="_blank" style="text-align: center;">

<img src="hardcover.png" width = "300">

</a>

# Ideia sobre medidas de posição

Vamos usar o `leem`!

. . .

<div class="columns">

<div class="column" width="50%">

``` r
library(leem)
showpar()
```

</div>

<div class="column" width="50%">

<center>

<img src="leem.png" title="Imagens: Logo leem" width = "500">

</center>

</div>

</div>

# Tipos de medidas de posição

- Média aritmética
- Mediana
- Moda

# Média Aritmética

<font size="+3">

> **Definição (Média aritmética)**: Seja uma amostra `\(X_1\)`, `\(X_2\)`, `\(\ldots\)`, `\(X_n\)`, de uma população `\(X_1\)`, `\(X_2\)`, `\(\ldots\)`, `\(X_N\)`, de tamanhos `\(n\)` e `\(N\)`, respectivamente, definimos a média aritmética por:
>
> e

</font>

## Média Aritmética (Dados agrupados)

<font size="+3">

> **Definição (Média aritmética):** Seja uma amostra `\(X_1\)`, `\(X_2\)`, , `\(X_n\)`, de tamanho `\(n\)`, agrupados em `\(k\)` grupos com variáveis `\(X_i\)` e frequência `\(F_i\)`, ou `\(k\)` classes com pontos médios `\(\tilde{X}_i\)` e `\(F_i\)` frequências, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(k\)` e `\(\sum_{i = 1}^{k}F_i = n\)`, então a média aritmética de uma amostra, é definida por:
> sendo `\(\tilde{X}_{i}\)` o ponto médio das classes.

</font>

## Exemplo 1 - Número de erros

Dados do número de erros encontrados em 20 conjuntos de caracteres monitorado em um canal de comunicação.

|     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|   3 |   1 |   0 |   1 |   3 |   2 |   4 |   1 |   3 |   1 |
|   1 |   1 |   2 |   3 |   3 |   2 |   0 |   2 |   0 |   1 |

<div class="fragment">

</div>

## Exemplo 1 - Número de erros

Retornando o exemplo anterior…

. . .

<div class="columns">

<div class="column" width="40%">

<font size="+3">

</font>

</div>

<div class="column" width="60%">

    ## 
    ## Tabela de frequência 
    ## Tipo de variável: discrete
    ## 
    ##   Groups Fi   Fr Fac1 Fac2 Fp Fac1p Fac2p
    ## 1      0  3 0.15    3   20 15    15   100
    ## 2      1  7 0.35   10   17 35    50    85
    ## 3      2  4 0.20   14   10 20    70    50
    ## 4      3  5 0.25   19    6 25    95    30
    ## 5      4  1 0.05   20    1  5   100     5
    ## ============================================== 
    ## Groups: Agrupamento discretizado 
    ## Fi: Frequência absoluta 
    ## Fr: Frequência relativa 
    ## Fac1: Frequência acumulada (abaixo de) 
    ## Fac2: Frequência acumulada (acima de) 
    ## Fp: Frequência percentual 
    ## Fac1p: Frequência acumulada percentual (abaixo de) 
    ## Fac2p: Frequência acumulada percentual (acima de)

</div>

</div>

## Exemplo 2 - Challenger

Os dados representam a temperatura (°F) do anel de vedação de cada teste de acionamento ou lançamento real do motor do foguete Challenger

|     |     |     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|  84 |  40 |  45 |  69 |  68 |  72 |  57 |  78 |  53 |  61 |  76 |  76 |
|  49 |  83 |  66 |  80 |  60 |  73 |  63 |  52 |  67 |  70 |  79 |  58 |
|  61 |  67 |  70 |  58 |  67 |  70 |  70 |  67 |  75 |  81 |  75 |  31 |

## Exemplo (continuação…)

Retornando o exemplo anterior…

<div class="columns">

<div class="column" width="40%">

<font size="+2">

</font>

</div>

<div class="column" width="60%">

<font size="+3">

    ## 
    ## Tabela de frequência 
    ## Tipo de variável: continuous
    ## 
    ##           Classes Fi   PM   Fr Fac1 Fac2 Fp  Fac1p  Fac2p
    ## 1 25.7 |---  36.3  1 31.0 0.03    1   36  3   2.78 100.00
    ## 2 36.3 |---  46.9  2 41.6 0.06    3   35  6   8.33  97.22
    ## 3 46.9 |---  57.5  4 52.2 0.11    7   33 11  19.44  91.67
    ## 4 57.5 |---  68.1 12 62.8 0.33   19   29 33  52.78  80.56
    ## 5 68.1 |---  78.7 12 73.4 0.33   31   17 33  86.11  47.22
    ## 6 78.7 |---  89.3  5 84.0 0.14   36    5 14 100.00  13.89
    ## 
    ## ============================================== 
    ## Classes: Agrupamento de classes 
    ## Fi: Frequência absoluta 
    ## PM: Ponto médio 
    ## Fr: Frequência relativa 
    ## Fac1: Frequência acumulada (abaixo de) 
    ## Fac2: Frequência acumulada (acima de) 
    ## Fp: Frequência percentual 
    ## Fac1p: Frequência acumulada percentual (abaixo de) 
    ## Fac2p: Frequência acumulada percentual (acima de)

</font>

</div>

</div>

## Usando o `leem`

<div class="nonincremental">

- Exemplo 1 - Número de erros
- Exemplo 2 - Challenger
- Funções: `new_leem()`, `tabfreq()`, `mean()`, `insert()`

</div>

``` r
dado |> # Entrada dos dados
  new_leem() |> # Estruturando os dados a classe leem
  # Opções:
  #   new_leem(variable = 1) # => variável discreta
  #   new_leem(variable = 2) # => variável contínua
  tabfreq() |> # Distribuição de frequência
  mean() # Cálculo da média
  # Opções:
  #   mean(grouped = TRUE) # => Dados agrupados (Padrão)
  #   mean(grouped = FALSE) # => Dados não agrupados
```

## Usando o `leem` (continuação…)

Exemplo 1 - Com agrupamento

``` r
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mean()
```

    ## [1] 1.7

Exemplo 1 - Sem agrupamento

``` r
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mean(grouped = FALSE)
```

    ## [1] 1.7

## Usando o `leem` (continuação…)

Exemplo 2 - Com agrupamento

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean()
```

    ## [1] 66.04

Exemplo 2 - Sem agrupamento

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mean(grouped = FALSE)
```

    ## [1] 65.86

## Usando o `leem` (continuação…)

Verificando a mediana no histograma:

. . .

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "mean", side = "left")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-1.png" width="70%" style="display: block; margin: auto;" />

## Características da média

<font size="+3">

- a unidade da média está na mesma escala da variável em estudo;
- a média é uma das medidas mais conhecidas e utilizadas, devido as suas propriedades estatísticas que serão vistas nos capítulos seguintes;
- é única para cada conjunto de dados;
- usada apenas para variáveis quantitativas;
- não pode ser calculada para dados agrupados que apresentam classes extremas abertas;
- é influenciada por dados discrepantes.

</font>

## Propriedades da média

<font size="+3">

> **Teorema:** Baseado na Definição sobre a média, e considerando `\(c\)` uma constante, então:
>
> - Se para uma amostra `\(X_1\)`, `\(X_2\)`, `\(\ldots\)`, `\(X_n\)`, a média aritmética é dada por `\(\bar{X} = \frac{\sum_{i=1}^{n}X_i}{n}\)`, então para uma transformação de `\(Y_i = X_i \pm c\)`, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(n\)`, a nova média aritmética é dada por `\(\bar{Y} = \bar{X} \pm c\)`;
>
> - Se para uma amostra `\(X_1\)`, `\(X_2\)`, , `\(X_n\)`, a média aritmética é dada por `\(\bar{X} = \frac{\sum_{i=1}^{n}X_i}{n}\)`, então para uma transformação de `\(Y_i = X_i \times c\)`, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(n\)`, a nova média aritmética é dada por `\(\bar{Y} = \bar{X} \times c\)`. Esse resultado vale também para a transformação `\(Y_i = X_i / m\)`, sendo `\(m\)` também uma constante. Basta usar `\(c = 1 / m\)` e o resultado é o mesmo.
>
> - A soma de quadrado de desvios dos dados em relação a uma constante `\(c\)`, é minimizada se `\(c = \bar{X}\)`.

</font>

# Mediana

<font size="+3">
**Definição (Mediana):** Seja uma amostra `\(X_1\)`, `\(X_2\)`, , `\(X_n\)`, de uma população `\(X_1\)`, `\(X_2\)`, , `\(X_N\)`, de tamanhos `\(n\)` e `\(N\)`, respectivamente, definimos a mediana por:
</font>

## Mediana (continuação…)

<font size="+3">
**(Continuação…):** sendo `\(\mu_d(X)\)` a mediana populacional e que `\(X_{(i)}\)` é a `\((i)\)`-ésima variável em ordem crescente de magnitude, tal que `\(X_{(1)} = \min\limits_{i}(X_i)\)` e `\(X_{(n)} = \max\limits_{i}(X_i)\)`. De modo similar,
sendo `\(Md(X)\)` a mediana amostral e que `\(X_{(i)}\)` é a `\((i)\)`-ésima variável em ordem crescente de magnitude, tal que `\(X_{(1)} = \min\limits_{i}X_i\)` e `\(X_{(n)} = \max\limits_{i}X_i\)`.
</font>

## Mediana (Agrupamento com classes)

<font size="+3">

> **Definição (Mediana):** Seja uma amostra `\(X_{(1)}\)`, `\(X_{(2)}\)`, , `\(X_{(n)}\)` em ordem crescente de magnitude, de tamanho `\(n\)`, agrupados em `\(k\)` classes com pontos médios `\(\tilde{X}_i\)` e `\(F_i\)` frequências, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(k\)` e `\(\sum_{i = 1}^{k}F_i = n\)`, então a mediana amostral é definida por:
> em que `\(LI_{Md}\)` é o limite inferior da classe da mediana, `\(f_{ant}\)` é a frequência acumulada (*abaixo de*) anterior a classe da mediana, `\(f_{Md}\)` frequência absoluta da classe da mediana, `\(c\)` a amplitude da classe da mediana,

</font>

## Mediana (continuação…)

<font size="+3">

**(continuação…):** ou de forma similar,
em que `\(LS_{Md}\)` é o limite superior da classe da mediana e `\(f_{post}\)` é a frequência acumulada (*acima de*) posterior a classe da mediana.

</font>

## Exemplo 1 - Número de erros

<font size="+3">

Dados do número de erros encontrados em 20 conjuntos de caracteres monitorado em um canal de comunicação.

|     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|   3 |   1 |   0 |   1 |   3 |   2 |   4 |   1 |   3 |   1 |
|   1 |   1 |   2 |   3 |   3 |   2 |   0 |   2 |   0 |   1 |

. . .

Ordenando os dados, temos:

|     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|   0 |   0 |   0 |   1 |   1 |   1 |   1 |   1 |   1 |   1 |
|   2 |   2 |   2 |   2 |   3 |   3 |   3 |   3 |   3 |   4 |

. . .

Calculando a mediana, temos:

</font>

## Exemplo 2 - Challenger

<font size="+3">

Os dados representam a temperatura (°F) do anel de vedação de cada teste de acionamento ou lançamento real do motor do foguete Challenger

|     |     |     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|  84 |  40 |  45 |  69 |  68 |  72 |  57 |  78 |  53 |  61 |  76 |  76 |
|  49 |  83 |  66 |  80 |  60 |  73 |  63 |  52 |  67 |  70 |  79 |  58 |
|  61 |  67 |  70 |  58 |  67 |  70 |  70 |  67 |  75 |  81 |  75 |  31 |

. . .

Ordenando os dados, temos:

|     |     |     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|  31 |  40 |  45 |  49 |  52 |  53 |  57 |  58 |  58 |  60 |  61 |  61 |
|  63 |  66 |  67 |  67 |  67 |  67 |  68 |  69 |  70 |  70 |  70 |  70 |
|  72 |  73 |  75 |  75 |  76 |  76 |  78 |  79 |  80 |  81 |  83 |  84 |

</font>

## Exemplo (continuação…)

Retornando o exemplo anterior…

. . .

<div class="columns">

<div class="column" width="50%">

<font size="+1">

Sem agrupamento, temos:

Com o agrupamento, temos:

</font>

</div>

<div class="column" width="50%">

<font size="+2">

    ## 
    ## Tabela de frequência 
    ## Tipo de variável: continuous
    ## 
    ##           Classes Fi   PM   Fr Fac1 Fac2 Fp  Fac1p  Fac2p
    ## 1 25.7 |---  36.3  1 31.0 0.03    1   36  3   2.78 100.00
    ## 2 36.3 |---  46.9  2 41.6 0.06    3   35  6   8.33  97.22
    ## 3 46.9 |---  57.5  4 52.2 0.11    7   33 11  19.44  91.67
    ## 4 57.5 |---  68.1 12 62.8 0.33   19   29 33  52.78  80.56
    ## 5 68.1 |---  78.7 12 73.4 0.33   31   17 33  86.11  47.22
    ## 6 78.7 |---  89.3  5 84.0 0.14   36    5 14 100.00  13.89
    ## 
    ## ============================================== 
    ## Classes: Agrupamento de classes 
    ## Fi: Frequência absoluta 
    ## PM: Ponto médio 
    ## Fr: Frequência relativa 
    ## Fac1: Frequência acumulada (abaixo de) 
    ## Fac2: Frequência acumulada (acima de) 
    ## Fp: Frequência percentual 
    ## Fac1p: Frequência acumulada percentual (abaixo de) 
    ## Fac2p: Frequência acumulada percentual (acima de)

</font>

</div>

</div>

## Usando o `leem`

<div class="nonincremental">

- Exemplo 1 - Número de erros
- Exemplo 2 - Challenger
- Funções: `new_leem()`, `tabfreq()`, `median()`, `insert()`

</div>

``` r
dado |> # Entrada dos dados
  new_leem() |> # Estruturando os dados a classe leem
  # Opções:
  #   new_leem(variable = 1) # => variável discreta
  #   new_leem(variable = 2) # => variável contínua
  tabfreq() |> # Distribuição de frequência
  median() # Cálculo da mediana
  # Opções:
  #   median(grouped = TRUE) # => Dados agrupados (Padrão)
  #   median(grouped = FALSE) # => Dados não agrupados
```

## Usando o `leem` (continuação…)

Exemplo 1 - Com agrupamento

``` r
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  median()
```

    ## [1] 1.5

Exemplo 1 - Sem agrupamento

``` r
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  median(grouped = FALSE)
```

    ## [1] 1.5

## Usando o `leem` (continuação…)

Exemplo 2 - Com agrupamento

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median()
```

    ## [1] 67.22

Exemplo 2 - Sem agrupamento

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  median(grouped = FALSE)
```

    ## [1] 67.5

## Usando o `leem` (continuação…)

Verificando a mediana no histograma:

. . .

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "median", side = "left")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-18-1.png" width="70%" style="display: block; margin: auto;" />

## Características da mediana

<font size="+3">

- A mediana não é influenciada por valores extremos;
- Uma medida que pode ser obtida em distribuições de frequências que apresentam classe com limites indefinidos;
- o resultado da mediana é obtida na mesma escala da variavel em estudo;
- a mediana é menos informativa que a média, por não levar em consideração os valores observados, mas as posições dessas observações;
- a mediana pode ser calculada em variáveis qualitativas ordinais, cuja média não pode ser obtida;
- a mediana ainda pode ser obtida em um conjunto de dados em que alguns valores ainda não foram registrados, caso em que a média não pode ser obtida.

</font>

## Propriedades da mediana

<font size="+2">

> **Teorema:** Baseado na Definição sobre a mediana, e considerando `\(c\)` uma constante, então:
>
> - Se para uma amostra `\(X_{(1)}\)`, `\(X_{(2)}\)`, `\(\ldots\)`, `\(X_{(n)}\)` em ordem crescente de magnitude, a mediana é dada por `\(Md{X} = X_{(\frac{n + 1}{2})}\)`, então para uma transformação de `\(Y_i = X_i \pm c\)`, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(n\)`, a mediana aritmética é dada por `\(Md(Y) = Md(X) \pm c\)`;
> - Se para uma amostra `\(X_{(1)}\)`, `\(X_{(2)}\)`, `\(\ldots\)`, `\(X_{(n)}\)` em ordem crescente de magnitude, a mediana é dada por `\(Md(X) = X_{(\frac{n + 1}{2})}\)`, então para uma transformação de `\(Y_i = X_i \pm c\)`, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(n\)`, a nova mediana é dada por `\(Md(Y) = Md(X) \times c\)`. Esse resultado vale também para a transformação `\(Y_i = X_i / m\)`, sendo `\(m\)` também uma constante. Basta usar `\(c = 1 / m\)` e o resultado é o mesmo.
> - A soma do módulo dos desvios dos dados em relação a uma constante arbitrária `\(c\)`, terá um valor mínimo se `\(c=Md(X)\)`.

</font>

# Moda

<font size="+3">
**Definição (Moda para dados discretizados):** Seja uma amostra `\(X_1\)`, `\(X_2\)`, , `\(X_n\)`, de uma população `\(X_1\)`, `\(X_2\)`, `\(\ldots\)`, `\(X_N\)`, de tamanhos `\(n\)` e `\(N\)`, respectivamente, cuja natureza da variável é discretizada. Então a moda representa o valor que mais se repete em um conjunto de dados. Denotamos `\(\mu_o\)` a moda populacional, e `\(Mo(X)\)` a moda amostral.
</font>

## Moda (Agrupamento com classes)

<font size="+3">

> **Definição (Moda):** Seja uma amostra `\(X_{(1)}\)`, `\(X_{(2)}\)`, , `\(X_{(n)}\)` em ordem crescente de magnitude, de tamanho `\(n\)`, agrupados em `\(k\)` classes com pontos médios `\(\tilde{X}_i\)` e `\(F_i\)` frequências, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(k\)` e `\(\sum_{i = 1}^{k}F_i = n\)`, então a moda amostral é definida por:
> em que `\(LI_{Mo}\)` o limite inferior da classe da moda, `\(\Delta_1 = f_{Mo} - f_{i_{ant}}\)`, `\(\Delta_2 = f_{Mo} - f_{i_{post}}\)`, `\(f_{Mo}\)` é a frequência absoluta da classe da moda, `\(f_{i_{ant}}\)` frequência absoluta anterior à classe da moda, `\(f_{i_{post}}\)` frequência posterior à classe da moda, e `\(c\)` a amplitude da classe.

</font>

## Exemplo 1 - Número de erros

Dados do número de erros encontrados em 20 conjuntos de caracteres monitorado em um canal de comunicação.

|     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|   3 |   1 |   0 |   1 |   3 |   2 |   4 |   1 |   3 |   1 |
|   1 |   1 |   2 |   3 |   3 |   2 |   0 |   2 |   0 |   1 |

. . .

Calculando a moda, temos:

## Exemplo 2 - Challenger

<font size="+3">

Os dados representam a temperatura (°F) do anel de vedação de cada teste de acionamento ou lançamento real do motor do foguete Challenger

|     |     |     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|  84 |  40 |  45 |  69 |  68 |  72 |  57 |  78 |  53 |  61 |  76 |  76 |
|  49 |  83 |  66 |  80 |  60 |  73 |  63 |  52 |  67 |  70 |  79 |  58 |
|  61 |  67 |  70 |  58 |  67 |  70 |  70 |  67 |  75 |  81 |  75 |  31 |

. . .

Ordenando os dados, temos:

|     |     |     |     |     |     |     |     |     |     |     |     |
|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
|  31 |  40 |  45 |  49 |  52 |  53 |  57 |  58 |  58 |  60 |  61 |  61 |
|  63 |  66 |  67 |  67 |  67 |  67 |  68 |  69 |  70 |  70 |  70 |  70 |
|  72 |  73 |  75 |  75 |  76 |  76 |  78 |  79 |  80 |  81 |  83 |  84 |

</font>

## Exemplo (continuação…)

Retornando o exemplo anterior…

. . .

<div class="columns">

<div class="column" width="50%">

<font size="+1">

Sem agrupamento, temos:

Com o agrupamento, temos:

</font>

</div>

<div class="column" width="50%">

<font size="+2">

    ## 
    ## Tabela de frequência 
    ## Tipo de variável: continuous
    ## 
    ##           Classes Fi   PM   Fr Fac1 Fac2 Fp  Fac1p  Fac2p
    ## 1 25.7 |---  36.3  1 31.0 0.03    1   36  3   2.78 100.00
    ## 2 36.3 |---  46.9  2 41.6 0.06    3   35  6   8.33  97.22
    ## 3 46.9 |---  57.5  4 52.2 0.11    7   33 11  19.44  91.67
    ## 4 57.5 |---  68.1 12 62.8 0.33   19   29 33  52.78  80.56
    ## 5 68.1 |---  78.7 12 73.4 0.33   31   17 33  86.11  47.22
    ## 6 78.7 |---  89.3  5 84.0 0.14   36    5 14 100.00  13.89
    ## 
    ## ============================================== 
    ## Classes: Agrupamento de classes 
    ## Fi: Frequência absoluta 
    ## PM: Ponto médio 
    ## Fr: Frequência relativa 
    ## Fac1: Frequência acumulada (abaixo de) 
    ## Fac2: Frequência acumulada (acima de) 
    ## Fp: Frequência percentual 
    ## Fac1p: Frequência acumulada percentual (abaixo de) 
    ## Fac2p: Frequência acumulada percentual (acima de)

</font>

</div>

</div>

## Usando o `leem`

<div class="nonincremental">

- Exemplo 1 - Número de erros
- Exemplo 2 - Challenger
- Funções: `new_leem()`, `tabfreq()`, `mfreq()`, `insert()`

</div>

``` r
dado |> # Entrada dos dados
  new_leem() |> # Estruturando os dados a classe leem
  # Opções:
  #   new_leem(variable = 1) # => variável discreta
  #   new_leem(variable = 2) # => variável contínua
  tabfreq() |> # Distribuição de frequência
  mfreq() # Cálculo da média
  # Opções:
  #   mfreq(grouped = TRUE) # => Dados agrupados (Padrão)
  #   mfreq(grouped = FALSE) # => Dados não agrupados
```

## Usando o `leem` (continuação…)

Exemplo 1 - Com agrupamento

``` r
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mfreq()
```

    ## [1] 1

Exemplo 1 - Sem agrupamento

``` r
d1 |>
  new_leem(variable = 1) |>
  tabfreq() |>
  mfreq(grouped = FALSE)
```

    ## [1] 1

## Usando o `leem` (continuação…)

Exemplo 2 - Com agrupamento

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq()
```

    ## [1] 68.1 68.1

Exemplo 2 - Sem agrupamento

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  mfreq(grouped = FALSE)
```

    ## [1] 67 70

## Usando o `leem` (continuação…)

Verificando a moda no histograma:

. . .

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "mode", side = "left")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-27-1.png" width="70%" style="display: block; margin: auto;" />

## Usando o `leem` (continuação…)

Rearrajando as classes …

. . .

<div class="columns">

<div class="column" width="50%">

<font size="+2">

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq(k = 5) # Apenas com 5 classes
```

    ## 
    ## Tabela de frequência 
    ## Tipo de variável: continuous
    ## 
    ##             Classes Fi    PM   Fr Fac1 Fac2 Fp  Fac1p  Fac2p
    ## 1 24.38 |---  37.62  1 31.00 0.03    1   36  3   2.78 100.00
    ## 2 37.62 |---  50.88  3 44.25 0.08    4   35  8  11.11  97.22
    ## 3 50.88 |---  64.12  9 57.50 0.25   13   32 25  36.11  88.89
    ## 4 64.12 |---  77.38 17 70.75 0.47   30   23 47  83.33  63.89
    ## 5 77.38 |---  90.62  6 84.00 0.17   36    6 17 100.00  16.67
    ## 
    ## ============================================== 
    ## Classes: Agrupamento de classes 
    ## Fi: Frequência absoluta 
    ## PM: Ponto médio 
    ## Fr: Frequência relativa 
    ## Fac1: Frequência acumulada (abaixo de) 
    ## Fac2: Frequência acumulada (acima de) 
    ## Fp: Frequência percentual 
    ## Fac1p: Frequência acumulada percentual (abaixo de) 
    ## Fac2p: Frequência acumulada percentual (acima de)

</font>

</div>

<div class="column" width="50%">

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-29-1.png" width="100%" style="display: block; margin: auto;" />

</div>

</div>

## Características da moda

<font size="+3">

- A moda não é influenciada por valores extremos, desde que estes não pertençam a classe modal;
- Uma medida que pode ser obtida em distribuições de frequências que apresentam classe com limites indefinidos;
- o resultado da moda é obtida na mesma escala da variavel em estudo;
- a moda é menos informativa que a média, por não levar em consideração os valores observados;
- a moda pode ser calculada para todas as naturezas de variáveis;
- a moda é a medida mais simples dentre as apresentadas;

</font>

## Propriedades da moda

<font size="+3">

> **Teorema:** Baseado na Definição sobre a moda, e considerando `\(c\)` uma constante, então:
>
> - Se para uma amostra `\(X_1\)`, `\(X_2\)`, , `\(X_n\)` em ordem crescente de magnitude, a moda representa o valor de maior frequência e representado por `\(Mo(X)\)`, então para uma transformação de `\(Y_i = X_i \pm c\)`, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(n\)`, a moda é dada por `\(Mo(Y) = Mo(X) \pm c\)`;
> - Se para uma amostra `\(X_1\)`, `\(X_2\)`, , `\(X_n\)` em ordem crescente de magnitude, a moda representa o valor de maior frequência e representado por `\(Mo(X)\)`, então para uma transformação de `\(Y_i = X_i \pm c\)`, para `\(i\)` `\(=\)` `\(1\)`, `\(2\)`, `\(\ldots\)`, `\(n\)`, a nova moda é dada por `\(Mo(Y) = Mo(X) \times c\)`. Esse resultado vale também para a transformação `\(Y_i = X_i / m\)`, sendo `\(m\)` também uma constante. Basta usar `\(c = 1 / m\)` e o resultado é o mesmo.

</font>

# Usando o `leem`

Inserindo as três medidas no histograma:

. . .

``` r
d2 |>
  new_leem(variable = 2) |>
  tabfreq() |>
  hist() |>
  insert(type = "all", larrow = 0.4, lcol = c("red", "blue", "black"))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-30-1.png" width="70%" style="display: block; margin: auto;" />

# Questões?

<a href="https://bendeivide.github.io/" data-preview-link="true">Dúvidas e Sugestões</a>

<a href="https://bendeivide.github.io/#contact" data-preview-link="true">Contato</a>

# Próximas aulas

<a href="https://bendeivide.github.io/courses/epaec/" target="_blank" style="text-align: center;">

<img src="ben.png" width = "400">

</a>
<center>
<a href="/courses/epaec"  target="_blank" >bendeivide.github.io/courses/epaec</a>
</center>

# Referências

<!-- 

::: {.notes} 

📝 Mostrar a relação do Método científico com as Definições gerais da estatística (Smoothdraw)

:::



:::: {.columns}

::: {.column width="90%"}



```r
library(leem)
atot <- c(1245870, 903207.02, 237765.20, 1559167.89,
          276419.84, 164123.96, 277466.76, 223644.53, 142470.76)
atot |>
  new_leem(variable = 2) # ou new_leem(variable = "continuous")
```

```
## [1] 1245870.0  903207.0  237765.2 1559167.9  276419.8  164124.0  277466.8
## [8]  223644.5  142470.8
```


```r
library(leem)
atot <- c(1245870, 903207.02, 237765.20, 1559167.89,
          276419.84, 164123.96, 277466.76, 223644.53, 142470.76)
atotleem <- new_leem(atot, variable = 2) # ou new_leem(variable = "discrete")
atotleem
```

```
## [1] 1245870.0  903207.0  237765.2 1559167.9  276419.8  164124.0  277466.8
## [8]  223644.5  142470.8
```

```r
class(atotleem)
```

```
## [1] "leem"
```


:::

::: {.column width="10%"}

<center>

<img src="leem.png" title="Imagens: Logo leem" width = "500">

</center>

:::

::::



::: {.nonincremental}

-   Introdução
    -   Nossa vida atual é assim hoje!

:::


-->

<div id="refs" class="references csl-bib-body">

<div id="ref-batista2023" class="csl-entry">

BATISTA, B. D. O. **[Estatística e Probabilidade: Aplicada às Engenharias e Ciências](https://bendeivide.github.io/books/epaec/)**. Ouro Branco, MG, Brasil: \[s.n.\], 2023.

</div>

</div>
