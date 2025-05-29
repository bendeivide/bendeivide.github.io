---
title: "Estatística Experimental"
subtitle: "Aula 16 | Análise de regressão na ANAVA"
title-slide-attributes:
    data-background-image: cap.png

author: "{{< fa user-tie >}} [Ben Dêivide](http://bendeivide.github.io) | {{< fa school >}} [UFSJ](https://www.ufsj.edu.br/)"
bibliography: biblio.bib
link-citations: true
csl: associacao-brasileira-de-normas-tecnicas-ipea.csl
lang: "pt-br"
format: 
  revealjs:
    include-in-header: 
      text: |
        <link rel="icon" type="image/png" href="logo.png">
    navigation-mode: vertical # Slides horizontais e verticais
    theme: [dark, ben-slide.scss]
    transition: slide
    background-transition: fade
#    transition-speed: fade
    footer: "[ESTEXP](https://bendeivide.github.io/courses/estexp/) | <https://bendeivide.github.io/>" # Rodapé
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
editor: source
---

# Filosofia de publicação (Selo DC)

<a href="https://bendeivide.github.io/dc/" target="_blank" style="text-align: center;">

<img src="SeloDC-branco.png" width = "400">

</a>

# Livro de Apoio

Usaremos Batista ([2025](#ref-batista2025)):

<a href="https://bendeivide.github.io/books/pae/" target="_blank" style="text-align: center;">

<img src="hardcover.png" width = "300">

</a>

# Objetivos da Aula

- Relacionar ANOVA e modelos de regressão
- Aplicar regressão linear e polinomial a dados com fator quantitativo
- Interpretar os coeficientes do modelo
- Avaliar a adequação do modelo por meio dos resíduos

# Quando usar regressão na ANOVA?

- Quando o fator da ANOVA é **quantitativo**, pode-se usar regressão para:
  - **Modelar tendência** da variável resposta
  - **Testar significância** da relação
  - **Otimizar resultados** (por exemplo, ponto ótimo)

# Exemplo: Engenharia Civil

> Um engenheiro civil testou diferentes proporções de aditivo plastificante (0%, 0.5%, 1.0%, 1.5% e 2.0%) na mistura de concreto. A resistência à compressão (em MPa) foi registrada após 28 dias.

## Dados do experimento

</br>
</br>

``` r
library(dplyr)
```

    ## 
    ## Anexando pacote: 'dplyr'

    ## Os seguintes objetos são mascarados por 'package:stats':
    ## 
    ##     filter, lag

    ## Os seguintes objetos são mascarados por 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyr)
library(gt)

# Dados originais
set.seed(123)
aditivo <- rep(c(0.0, 0.5, 1.0, 1.5, 2.0), each = 3)
resistencia <- c(
  rnorm(3, mean = 25.0, sd = 0.8),  # 0%
  rnorm(3, mean = 28.0, sd = 0.8),  # 0.5%
  rnorm(3, mean = 32.0, sd = 0.8),  # 1.0%
  rnorm(3, mean = 33.0, sd = 0.8),  # 1.5%
  rnorm(3, mean = 31.0, sd = 0.8)   # 2.0%
)
repeticao <- factor(rep(1:3, times = 5))

dados <- data.frame(aditivo, resistencia, repeticao)

# Pivotar para formato wide
dados_wide <- dados %>%
  pivot_wider(
    names_from = repeticao,
    values_from = resistencia,
    names_prefix = "Rep "
  ) %>%
  arrange(aditivo)

# Criar tabela gt
tabela_pivot <- gt(dados_wide) %>%
  fmt_number(
    columns = vars(starts_with("Rep")),
    decimals = 2
  ) %>%
  cols_label(
    aditivo = "Proporção de Aditivo (%)",
    `Rep 1` = "Repetição 1",
    `Rep 2` = "Repetição 2",
    `Rep 3` = "Repetição 3"
  ) %>%
  tab_header(
    title = "Resistência à Compressão do Concreto por Proporção de Aditivo",
    subtitle = "DIC com 5 níveis e 3 repetições"
  ) %>%
  tab_options(
    table.font.size = px(25)
  ) %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  # Destacar linhas ímpares
  tab_style(
    style = list(
      cell_fill(color = "#f2f2f2")  # cinza claro
    ),
    locations = cells_body(
      rows = seq(1, nrow(dados_wide), by = 2)
    )
  )
```

    ## Warning: Since gt v0.3.0, `columns = vars(...)` has been deprecated.
    ## • Please use `columns = c(...)` instead.

``` r
# Mostrar tabela
tabela_pivot
```

<div id="isdnqkgulo" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#isdnqkgulo table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#isdnqkgulo thead, #isdnqkgulo tbody, #isdnqkgulo tfoot, #isdnqkgulo tr, #isdnqkgulo td, #isdnqkgulo th {
  border-style: none;
}
&#10;#isdnqkgulo p {
  margin: 0;
  padding: 0;
}
&#10;#isdnqkgulo .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 25px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#isdnqkgulo .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#isdnqkgulo .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#isdnqkgulo .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#isdnqkgulo .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#isdnqkgulo .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#isdnqkgulo .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#isdnqkgulo .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#isdnqkgulo .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#isdnqkgulo .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#isdnqkgulo .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#isdnqkgulo .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#isdnqkgulo .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#isdnqkgulo .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#isdnqkgulo .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#isdnqkgulo .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#isdnqkgulo .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#isdnqkgulo .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#isdnqkgulo .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#isdnqkgulo .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#isdnqkgulo .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#isdnqkgulo .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#isdnqkgulo .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#isdnqkgulo .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#isdnqkgulo .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#isdnqkgulo .gt_left {
  text-align: left;
}
&#10;#isdnqkgulo .gt_center {
  text-align: center;
}
&#10;#isdnqkgulo .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#isdnqkgulo .gt_font_normal {
  font-weight: normal;
}
&#10;#isdnqkgulo .gt_font_bold {
  font-weight: bold;
}
&#10;#isdnqkgulo .gt_font_italic {
  font-style: italic;
}
&#10;#isdnqkgulo .gt_super {
  font-size: 65%;
}
&#10;#isdnqkgulo .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#isdnqkgulo .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#isdnqkgulo .gt_indent_1 {
  text-indent: 5px;
}
&#10;#isdnqkgulo .gt_indent_2 {
  text-indent: 10px;
}
&#10;#isdnqkgulo .gt_indent_3 {
  text-indent: 15px;
}
&#10;#isdnqkgulo .gt_indent_4 {
  text-indent: 20px;
}
&#10;#isdnqkgulo .gt_indent_5 {
  text-indent: 25px;
}
&#10;#isdnqkgulo .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#isdnqkgulo div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="4" class="gt_heading gt_title gt_font_normal" style>Resistência à Compressão do Concreto por Proporção de Aditivo</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>DIC com 5 níveis e 3 repetições</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="aditivo">Proporção de Aditivo (%)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Rep-1">Repetição 1</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Rep-2">Repetição 2</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Rep-3">Repetição 3</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="aditivo" class="gt_row gt_center" style="background-color: #F2F2F2;">0.0</td>
<td headers="Rep 1" class="gt_row gt_center" style="background-color: #F2F2F2;">24.55</td>
<td headers="Rep 2" class="gt_row gt_center" style="background-color: #F2F2F2;">24.82</td>
<td headers="Rep 3" class="gt_row gt_center" style="background-color: #F2F2F2;">26.25</td></tr>
    <tr><td headers="aditivo" class="gt_row gt_center">0.5</td>
<td headers="Rep 1" class="gt_row gt_center">28.06</td>
<td headers="Rep 2" class="gt_row gt_center">28.10</td>
<td headers="Rep 3" class="gt_row gt_center">29.37</td></tr>
    <tr><td headers="aditivo" class="gt_row gt_center" style="background-color: #F2F2F2;">1.0</td>
<td headers="Rep 1" class="gt_row gt_center" style="background-color: #F2F2F2;">32.37</td>
<td headers="Rep 2" class="gt_row gt_center" style="background-color: #F2F2F2;">30.99</td>
<td headers="Rep 3" class="gt_row gt_center" style="background-color: #F2F2F2;">31.45</td></tr>
    <tr><td headers="aditivo" class="gt_row gt_center">1.5</td>
<td headers="Rep 1" class="gt_row gt_center">32.64</td>
<td headers="Rep 2" class="gt_row gt_center">33.98</td>
<td headers="Rep 3" class="gt_row gt_center">33.29</td></tr>
    <tr><td headers="aditivo" class="gt_row gt_center" style="background-color: #F2F2F2;">2.0</td>
<td headers="Rep 1" class="gt_row gt_center" style="background-color: #F2F2F2;">31.32</td>
<td headers="Rep 2" class="gt_row gt_center" style="background-color: #F2F2F2;">31.09</td>
<td headers="Rep 3" class="gt_row gt_center" style="background-color: #F2F2F2;">30.56</td></tr>
  </tbody>
  &#10;  
</table>
</div>

# Gráfico exploratório

``` r
library(ggplot2) # Anexando o pacote ggplot2

ggplot(dados, aes(x = aditivo, y = resistencia)) +
  geom_point(size = 3, color = "steelblue") +
  labs(title = "Resistência vs Aditivo Plastificante",
       x = "Proporção de Aditivo (%)",
       y = "Resistência à Compressão (MPa)") +
  theme_minimal()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-1.png" width="672" style="display: block; margin: auto;" />

# Verificação da ANAVA

<div class="nonincremental">

- Correto

``` r
aditivo_fator <- as.factor(aditivo)
anava <- aov(resistencia ~ aditivo_fator, data = dados)
summary(anava)
```

    ##               Df Sum Sq Mean Sq F value   Pr(>F)    
    ## aditivo_fator  4 118.92  29.729   59.86 6.01e-07 ***
    ## Residuals     10   4.97   0.497                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

- Errado

``` r
anava2 <- aov(resistencia ~ aditivo, data = dados)
summary(anava2)
```

    ##             Df Sum Sq Mean Sq F value   Pr(>F)    
    ## aditivo      1  80.29   80.29   23.94 0.000294 ***
    ## Residuals   13  43.59    3.35                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

</div>

# Análise de Resíduo

``` r
par(mfrow=c(2,2))
plot(anava)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="672" style="display: block; margin: auto;" />

## Análise de Resíduo

<div class="nonincremental">

- Normalidade

``` r
library(car)
```

    ## Carregando pacotes exigidos: carData

    ## 
    ## Anexando pacote: 'car'

    ## O seguinte objeto é mascarado por 'package:dplyr':
    ## 
    ##     recode

``` r
library(nortest)
library(lmtest)
```

    ## Carregando pacotes exigidos: zoo

    ## 
    ## Anexando pacote: 'zoo'

    ## Os seguintes objetos são mascarados por 'package:base':
    ## 
    ##     as.Date, as.Date.numeric

``` r
# Resíduos do modelo
residuos <- residuals(anava)

# Teste de Shapiro-Wilk (Normalidade)
shapiro.test(residuos)
```

    ## 
    ## 	Shapiro-Wilk normality test
    ## 
    ## data:  residuos
    ## W = 0.88668, p-value = 0.05976

``` r
# Outros testes (opcional)
#ad.test(residuos)        # Anderson-Darling
#lillie.test(residuos)    # Lilliefors
```

</div>

## Análise de Resíduo

<div class="nonincremental">

- Homogeneidade

``` r
# Teste de Bartlett (Homogeneidade)
bartlett.test(resistencia ~ aditivo, data = dados)
```

    ## 
    ## 	Bartlett test of homogeneity of variances
    ## 
    ## data:  resistencia by aditivo
    ## Bartlett's K-squared = 1.088, df = 4, p-value = 0.8962

``` r
# Teste de Levene (mais robusto)
#leveneTest(resistencia ~ aditivo, data = dados)
```

- Independência

``` r
# Teste de Durbin-Watson Independência
durbinWatsonTest(anava)
```

    ##  lag Autocorrelation D-W Statistic p-value
    ##    1       -0.177091      2.230554   0.528
    ##  Alternative hypothesis: rho != 0

</div>

# Regressão na ANAVA (Errado)

``` r
mod_linear <- lm(resistencia ~ aditivo, data = dados)
summary(mod_linear)
```

    ## 
    ## Call:
    ## lm(formula = resistencia ~ aditivo, data = dados)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.6385 -1.8537 -0.1825  1.3074  2.4468 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  26.6500     0.8189  32.542 7.64e-14 ***
    ## aditivo       3.2719     0.6687   4.893 0.000294 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.831 on 13 degrees of freedom
    ## Multiple R-squared:  0.6481,	Adjusted R-squared:  0.621 
    ## F-statistic: 23.94 on 1 and 13 DF,  p-value: 0.0002936

## Regressão na ANAVA (Correto)

``` r
library(ExpDes.pt)
# Anava no DIC
reganava <- dic(trat = dados$aditivo, resp = dados$resistencia,
    quali = FALSE) # Fator quantitativo
```

    ## ------------------------------------------------------------------------
    ## Quadro da analise de variancia
    ## ------------------------------------------------------------------------
    ##            GL      SQ      QM     Fc      Pr>Fc
    ## Tratamento  4 118.917 29.7292 59.859 6.0064e-07
    ## Residuo    10   4.967  0.4967                  
    ## Total      14 123.884                          
    ## ------------------------------------------------------------------------
    ## CV = 2.36 %
    ## 
    ## ------------------------------------------------------------------------
    ## Teste de normalidade dos residuos ( Shapiro-Wilk ) 
    ## Valor-p:  0.05975596 
    ## De acordo com o teste de Shapiro-Wilk a 5% de significancia, os residuos podem ser considerados normais.
    ## ------------------------------------------------------------------------
    ## 
    ## ------------------------------------------------------------------------
    ## Teste de homogeneidade de variancia 
    ## valor-p:  0.8961704 
    ## De acordo com o teste de bartlett a 5% de significancia, as variancias podem ser consideradas homogeneas.
    ## ------------------------------------------------------------------------
    ## 
    ## Ajuste de modelos polinomiais de regressao
    ## ------------------------------------------------------------------------
    ## 
    ## Modelo Linear
    ## =========================================
    ##    Estimativa Erro.padrao   tc    valor.p
    ## -----------------------------------------
    ## b0  26.6500     0.3152    84.5577    0   
    ## b1   3.2719     0.2573    12.7146    0   
    ## -----------------------------------------
    ## 
    ## R2 do modelo linear
    ## --------
    ## 0.675185
    ## --------
    ## 
    ## Analise de variancia do modelo linear
    ## ======================================================
    ##                      GL   SQ      QM      Fc   valor.p
    ## ------------------------------------------------------
    ## Efeito linear        1  80.2909 80.2909 161.66    0   
    ## Desvios de Regressao 3  38.6260 12.8753 25.92   5e-05 
    ## Residuos             10 4.9666  0.4967                
    ## ------------------------------------------------------
    ## ------------------------------------------------------------------------
    ## 
    ## Modelo quadratico
    ## =========================================
    ##    Estimativa Erro.padrao   tc    valor.p
    ## -----------------------------------------
    ## b0  24.8453     0.3829    64.8827    0   
    ## b1  10.4908     0.9072    11.5638    0   
    ## b2  -3.6094     0.4350    -8.2980 0.00001
    ## -----------------------------------------
    ## 
    ## R2 do modelo quadratico
    ## --------
    ## 0.962767
    ## --------
    ## 
    ## Analise de variancia do modelo quadratico
    ## ======================================================
    ##                      GL   SQ      QM      Fc   valor.p
    ## ------------------------------------------------------
    ## Efeito linear        1  80.2909 80.2909 161.66    0   
    ## Efeito quadratico    1  34.1984 34.1984 68.86   1e-05 
    ## Desvios de Regressao 2  4.4276  2.2138   4.46  0.0413 
    ## Residuos             10 4.9666  0.4967                
    ## ------------------------------------------------------
    ## ------------------------------------------------------------------------
    ## 
    ## Modelo cubico
    ## =========================================
    ##    Estimativa Erro.padrao   tc    valor.p
    ## -----------------------------------------
    ## b0  25.2255     0.4040    62.4448    0   
    ## b1   5.0406     2.0553    2.4525  0.0341 
    ## b2   3.9955     2.6098    1.5309  0.1568 
    ## b3  -2.5350     0.8578    -2.9553 0.0144 
    ## -----------------------------------------
    ## 
    ## R2 do modelo cubico
    ## --------
    ## 0.999243
    ## --------
    ## 
    ## Analise de variancia do modelo cubico
    ## ======================================================
    ##                      GL   SQ      QM      Fc   valor.p
    ## ------------------------------------------------------
    ## Efeito linear        1  80.2909 80.2909 161.66    0   
    ## Efeito quadratico    1  34.1984 34.1984 68.86   1e-05 
    ## Efeito cubico        1  4.3376  4.3376   8.73  0.0144 
    ## Desvios de Regressao 1  0.0900  0.0900   0.18  0.67933
    ## Residuos             10 4.9666  0.4967                
    ## ------------------------------------------------------
    ## ------------------------------------------------------------------------

## Análise de resíduo

``` r
# Analise de residuo
plotres(reganava)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" style="display: block; margin: auto;" />

# Gráfico da curva ajustada

``` r
ggplot(dados, aes(x = aditivo, y = resistencia)) +
  geom_point(size = 3, color = "darkblue") +
  stat_smooth(method = "lm", formula = y ~ poly(x, 3, raw = TRUE),
              se = FALSE, color = "darkgreen") +
  labs(title = "Resistência do Concreto vs Aditivo (DIC)",
       x = "Proporção de Aditivo (%)",
       y = "Resistência (MPa)") +
  theme_minimal()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-12-1.png" width="672" style="display: block; margin: auto;" />

# Escolha do modelo

- Análise de Resíduos
- Coeficiente de determinação
- Desvio de regressão
- Coeficiente de determinação ajustado (`\(R^2_{aj}\)`)
- Praticidade

## Coeficiente de determinação ajustado

$$
R^2_{ajustado} = 1 - \left( \frac{(1 - R^2)(n - 1)}{n - p - 1} \right)
$$

Onde:

- `\(R^2\)` é o coeficiente de determinação (não ajustado);
- `\(n\)` é o número total de observações;
- `\(p\)` é o número de variáveis explicativas no modelo (excluindo o intercepto).

## Coeficiente de determinação ajustado

``` r
# Funcao para o R2aj
r2aj <- function(r2, n, p) {
  1 - (1 - r2) * (n - 1) / (n - p - 1)
}
# Modelo
Modelo <- 1:3
# R2
r2 <- c(reganava$reg$`R2 reta`, reganava$reg$`R2 parabola`, reganava$reg$`R2 cubica`)
# Coeficiente de determinacao ajustado
Coef.aj <- r2aj(r2, 15, Modelo)
# Resultado
data.frame(Modelo, Coef.aj, r2)
```

    ##   Modelo   Coef.aj        r2
    ## 1      1 0.6501989 0.6751847
    ## 2      2 0.9565618 0.9627673
    ## 3      3 0.9990366 0.9992430

# Questões?

<a href="https://bendeivide.github.io/" data-preview-link="true">Dúvidas e Sugestões</a>

<a href="https://bendeivide.github.io/#contact" data-preview-link="true">Contato</a>

# Próximas aulas

<a href="https://bendeivide.github.io/courses/epaec/" target="_blank" style="text-align: center;">

<img src="ben.png" width = "400">

</a>
<center>
<a href="/courses/estexp"  target="_blank" >bendeivide.github.io/courses/estexp</a>
</center>

# Referências

<div id="refs" class="references csl-bib-body" entry-spacing="0">

<div id="ref-batista2025" class="csl-entry">

BATISTA, B. D. O. **[PLanejamento e Análise de Experimentos](https://bendeivide.github.io/books/epaec/)**. Ouro Branco, MG, Brasil: \[s.n.\], 2025.

</div>

</div>
