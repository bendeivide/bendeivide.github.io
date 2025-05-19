---
title: "Estatística Experimental"
subtitle: "Aula 14 | Análise de resíduo na ANAVA"
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
#     numbers: true # inserir numero nos itens do menu
#     pointer: # Plugin para o ponteiro
#       - key: q
#       - color: red
#       - pointerSize: 16
#       - alwaysVisible: false
# revealjs-plugins:
#   - pointer
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

# Objetivo da Aula

- Compreender o conceito de resíduos em modelos de ANOVA
- Interpretar gráficos de resíduos
- Identificar desvios dos pressupostos do modelo
- Aplicar procedimentos para avaliar os pressupostos

# Lembrete: Pressupostos da ANOVA

- Independência dos erros
- Normalidade dos erros
- Homogeneidade de variâncias (homocedasticidade)
- Aditividade dos efeitos

. . .

A verificação desses pressupostos é feita por meio da **análise dos resíduos**.

# O que são Resíduos?

- Os **resíduos** são as diferenças entre os valores observados e os valores ajustados pelo modelo:

. . .

$$
e_{ij} = y_{ij} - \hat{y}_{ij}
$$
- Eles representam a **parte não explicada** pelo modelo.

# Exemplo

- Um braço robótico é programado para mover-se até uma posição alvo
- Utiliza-se diferentes algoritmos de controle para comandar o movimento
- O desempenho é medido em termos do erro médio absoluto de posicionamento (mm) após 10 execuções por repetição

## Exemplo

- **Fator (Tratamento)**: Tipo de algoritmo de controle (4 níveis)
  - PID
  - PID com autoajuste
  - Controle Fuzzy
  - Controle LQR
- **Unidades experimentais**: Execuções independentes do movimento com o braço robótico, em condições idênticas.
- **Resposta**: Erro médio absoluto de posicionamento (mm)

## Exemplo

``` r
library(gt)
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

set.seed(123)

# Níveis do fator
tratamento <- rep(c("PID", "AutoPID", "Fuzzy", "LQR"), each = 5)

# Resposta simulada (erro médio absoluto)
ema <- c(
  rnorm(5, mean = 1.2, sd = 0.1),  # PID
  rnorm(5, mean = 1.0, sd = 0.1),  # AutoPID
  rnorm(5, mean = 0.8, sd = 0.15), # Fuzzy
  rnorm(5, mean = 0.9, sd = 0.12)  # LQR
)

# Monta data.frame
dados <- data.frame(Tratamento = tratamento, EMA = ema)

# Adiciona índice para reorganizar em formato wide
dados <- dados |> 
  group_by(Tratamento) |> 
  mutate(Repeticao = row_number()) |> 
  ungroup()

# Reorganiza em formato wide
dados_wide <- dados |> 
  pivot_wider(names_from = Tratamento, values_from = EMA)

# Cria a tabela gt
tabela_gt <- gt(dados_wide) |>
  fmt_number(
    decimals = 2,
    use_seps = FALSE
  ) |>
  tab_header(title = "Erro Médio Absoluto por Algoritmo de Controle")

# Visualiza a tabela
tabela_gt
```

<div id="ojmgiijwug" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ojmgiijwug table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ojmgiijwug thead, #ojmgiijwug tbody, #ojmgiijwug tfoot, #ojmgiijwug tr, #ojmgiijwug td, #ojmgiijwug th {
  border-style: none;
}
&#10;#ojmgiijwug p {
  margin: 0;
  padding: 0;
}
&#10;#ojmgiijwug .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
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
&#10;#ojmgiijwug .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ojmgiijwug .gt_title {
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
&#10;#ojmgiijwug .gt_subtitle {
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
&#10;#ojmgiijwug .gt_heading {
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
&#10;#ojmgiijwug .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ojmgiijwug .gt_col_headings {
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
&#10;#ojmgiijwug .gt_col_heading {
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
&#10;#ojmgiijwug .gt_column_spanner_outer {
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
&#10;#ojmgiijwug .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ojmgiijwug .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ojmgiijwug .gt_column_spanner {
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
&#10;#ojmgiijwug .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ojmgiijwug .gt_group_heading {
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
&#10;#ojmgiijwug .gt_empty_group_heading {
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
&#10;#ojmgiijwug .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ojmgiijwug .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ojmgiijwug .gt_row {
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
&#10;#ojmgiijwug .gt_stub {
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
&#10;#ojmgiijwug .gt_stub_row_group {
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
&#10;#ojmgiijwug .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ojmgiijwug .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ojmgiijwug .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ojmgiijwug .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ojmgiijwug .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ojmgiijwug .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ojmgiijwug .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ojmgiijwug .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ojmgiijwug .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ojmgiijwug .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ojmgiijwug .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ojmgiijwug .gt_footnotes {
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
&#10;#ojmgiijwug .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ojmgiijwug .gt_sourcenotes {
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
&#10;#ojmgiijwug .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ojmgiijwug .gt_left {
  text-align: left;
}
&#10;#ojmgiijwug .gt_center {
  text-align: center;
}
&#10;#ojmgiijwug .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ojmgiijwug .gt_font_normal {
  font-weight: normal;
}
&#10;#ojmgiijwug .gt_font_bold {
  font-weight: bold;
}
&#10;#ojmgiijwug .gt_font_italic {
  font-style: italic;
}
&#10;#ojmgiijwug .gt_super {
  font-size: 65%;
}
&#10;#ojmgiijwug .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ojmgiijwug .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ojmgiijwug .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ojmgiijwug .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ojmgiijwug .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ojmgiijwug .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ojmgiijwug .gt_indent_5 {
  text-indent: 25px;
}
&#10;#ojmgiijwug .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#ojmgiijwug div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="5" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Erro Médio Absoluto por Algoritmo de Controle</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Repeticao">Repeticao</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="PID">PID</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="AutoPID">AutoPID</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Fuzzy">Fuzzy</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="LQR">LQR</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Repeticao" class="gt_row gt_right">1.00</td>
<td headers="PID" class="gt_row gt_right">1.14</td>
<td headers="AutoPID" class="gt_row gt_right">1.17</td>
<td headers="Fuzzy" class="gt_row gt_right">0.98</td>
<td headers="LQR" class="gt_row gt_right">1.11</td></tr>
    <tr><td headers="Repeticao" class="gt_row gt_right">2.00</td>
<td headers="PID" class="gt_row gt_right">1.18</td>
<td headers="AutoPID" class="gt_row gt_right">1.05</td>
<td headers="Fuzzy" class="gt_row gt_right">0.85</td>
<td headers="LQR" class="gt_row gt_right">0.96</td></tr>
    <tr><td headers="Repeticao" class="gt_row gt_right">3.00</td>
<td headers="PID" class="gt_row gt_right">1.36</td>
<td headers="AutoPID" class="gt_row gt_right">0.87</td>
<td headers="Fuzzy" class="gt_row gt_right">0.86</td>
<td headers="LQR" class="gt_row gt_right">0.66</td></tr>
    <tr><td headers="Repeticao" class="gt_row gt_right">4.00</td>
<td headers="PID" class="gt_row gt_right">1.21</td>
<td headers="AutoPID" class="gt_row gt_right">0.93</td>
<td headers="Fuzzy" class="gt_row gt_right">0.82</td>
<td headers="LQR" class="gt_row gt_right">0.98</td></tr>
    <tr><td headers="Repeticao" class="gt_row gt_right">5.00</td>
<td headers="PID" class="gt_row gt_right">1.21</td>
<td headers="AutoPID" class="gt_row gt_right">0.96</td>
<td headers="Fuzzy" class="gt_row gt_right">0.72</td>
<td headers="LQR" class="gt_row gt_right">0.84</td></tr>
  </tbody>
  &#10;  
</table>
</div>

. . .

- ANAVA

. . .

``` r
anava <- aov(EMA ~ Tratamento, data = dados); summary(anava)
```

    ##             Df Sum Sq Mean Sq F value   Pr(>F)    
    ## Tratamento   3 0.3959  0.1320   9.103 0.000949 ***
    ## Residuals   16 0.2319  0.0145                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Exemplo

- `\(y\)` (EMA observado)

. . .

``` r
yobs <- ema
head(yobs) # 6 primeiras obs
```

    ## [1] 1.143952 1.176982 1.355871 1.207051 1.212929 1.171506

- `\(\hat{y}\)` (EMA predito)

. . .

``` r
yhat <- fitted(anava)
head(yhat) # 6 primeiras obs
```

    ##         1         2         3         4         5         6 
    ## 1.2193570 1.2193570 1.2193570 1.2193570 1.2193570 0.9955681

## Exemplo

- Resíduo

. . .

``` r
e <- residuals(anava)
head(e) # 6 primeiras obs
```

    ##            1            2            3            4            5            6 
    ## -0.075404591 -0.042374775  0.136513805 -0.012306187 -0.006428253  0.175938396

. . .

- `\(e_{ij} = y_{ij} - \hat{y}_{ij}\)`

. . .

``` r
head(yobs - yhat) # 6 primeiras obs
```

    ##            1            2            3            4            5            6 
    ## -0.075404591 -0.042374775  0.136513805 -0.012306187 -0.006428253  0.175938396

## Por que Analisar os Resíduos?

- Identificar **falhas no modelo**
- Verificar **validade dos testes F e t**
- Garantir **confiabilidade das conclusões**

## Tipos de Gráficos Usados

- **Resíduos vs Valores Ajustados**
- **Histograma dos resíduos**
- **QQ-plot**
- **Resíduos vs Fatores**
- **Gráfico de Cook (influência dos pontos)**

# Resíduos vs Valores Ajustados

- Espera-se dispersão aleatória em torno de zero
- Padrões indicam:
  - Curvatura: possível não linearidade
  - Funil: heterocedasticidade

## Curvatura: possível não linearidade

``` r
set.seed(12)

# Tratamentos (níveis do fator categórico)
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Atribui nível numérico aos tratamentos
nível <- as.numeric(factor(tratamento))  # A=1, B=2, C=3, D=4

# Gera a resposta com curvatura forte (modelo quadrático com ruído)
resposta <- 5 + 10 * nível - 50 * nível^(1/2) + rnorm(20, sd = 0.5)

# Monta o data.frame
dados_curvatura <- data.frame(tratamento, resposta)

# Ajusta o modelo apenas com efeito de tratamento (modelo aditivo tradicional da ANOVA)
modelo_inadequado <- aov(resposta ~ tratamento, data = dados_curvatura)

# Gráfico de resíduos vs valores ajustados
plot(fitted(modelo_inadequado), resid(modelo_inadequado),
     main = "DIC com Violação de Aditividade (Curvatura Visível)",
     xlab = "Valores Ajustados", ylab = "Resíduos",
     pch = 19, col = "firebrick")
abline(h = 0, col = "darkgray", lwd = 2)
lines(lowess(fitted(modelo_inadequado), resid(modelo_inadequado)),
      col = "orange", lwd = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-7-1.png" width="672" />

## Gráfico com linearidade

``` r
set.seed(10)

# Quatro tratamentos com média diferente, efeito aditivo
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Geração de dados com efeitos fixos e erro aleatório
efeitos <- c(A = 5, B = 6, C = 7, D = 8)
resposta <- efeitos[tratamento] + rnorm(20, mean = 0, sd = 1)

# Data frame
dados <- data.frame(tratamento = tratamento, resposta = resposta)

# Modelo
modelo <- aov(resposta ~ tratamento, data = dados)

# Resíduos vs Ajustados
plot(fitted(modelo), resid(modelo),
     main = "DIC - Modelo Adequado (Sem Curvatura)",
     xlab = "Valores Ajustados", ylab = "Resíduos",
     pch = 19, col = "darkgreen")
abline(h = 0, col = "red", lwd = 2)
lines(lowess(fitted(modelo), resid(modelo)), col = "orange", lwd = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-1.png" width="672" />

## Heterocedasticidade (Funil)

``` r
set.seed(123)

# Tratamentos
tratamento <- rep(c("A", "B", "C", "D"), each = 5)
nível <- as.numeric(factor(tratamento))  # A = 1, ..., D = 4

# Geração de respostas com variância crescente
# Média crescente com variância proporcional ao nível
resposta <- 5 + 1.5 * nível + rnorm(20, mean = 0, sd = nível * 0.5)

# Monta data.frame
dados_hetero <- data.frame(tratamento, resposta)

# Ajuste de modelo tradicional (pressupõe homogeneidade!)
modelo_hetero <- aov(resposta ~ tratamento, data = dados_hetero)

# Gráfico de resíduos vs valores ajustados
plot(fitted(modelo_hetero), resid(modelo_hetero),
     main = "DIC com Heterocedasticidade (Formato de Funil)",
     xlab = "Valores Ajustados", ylab = "Resíduos",
     pch = 19, col = "steelblue")
abline(h = 0, col = "darkgray", lwd = 2)
lines(lowess(fitted(modelo_hetero), resid(modelo_hetero)),
      col = "orange", lwd = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-1.png" width="672" />

# Histograma dos resíduos

- Formato aproximadamente simétrico (como um sino ou gaussiana)
- Moda única no centro (em torno de zero)
- Caudas decrescentes suavemente nos dois lados
- Sem assimetria (skewness) ou achatamento excessivo (kurtosis)
- Deve lembrar uma distribuição normal padrão, embora pequenas flutuações sejam normais em amostras pequenas

## Problemas de normalidade

``` r
set.seed(123)

# Fator com 4 níveis (DIC)
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Geração da variável resposta com erro assimétrico (exponencial)
resposta <- rep(c(5, 6, 7, 8), each = 5) + rexp(20, rate = 1.5)

# Ajusta modelo de ANOVA (pressupõe normalidade dos resíduos)
modelo_nnorm <- aov(resposta ~ tratamento)

# Resíduos do modelo
res <- resid(modelo_nnorm)

# Histograma com curva normal teórica
hist(res,
     prob = TRUE,
     main = "Histograma dos Resíduos (Não Normalidade)",
     xlab = "Resíduos",
     ylab = "Densidade",
     col = "mistyrose", border = "white")
curve(dnorm(x, mean = mean(res), sd = sd(res)),
      col = "blue", lwd = 2, add = TRUE)
rug(res)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-10-1.png" width="672" />

## Normalidade

``` r
set.seed(10)

# Fator com 4 níveis (DIC)
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Geração da resposta com erros normais (média 0, sd 1)
resposta <- rep(c(5, 6, 7, 8), each = 5) + rnorm(20, mean = 0, sd = 1)

# Ajuste do modelo ANOVA
modelo_norm <- aov(resposta ~ tratamento)

# Resíduos
res <- resid(modelo_norm)

# Histograma dos resíduos com curva normal teórica
hist(res,
     prob = TRUE,
     main = "Histograma dos Resíduos (Normalidade)",
     xlab = "Resíduos",
     ylab = "Densidade",
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(res), sd = sd(res)),
      col = "darkgreen", lwd = 2, add = TRUE)
rug(res)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" />

# QQ-plot (Normalidade)

- Se os resíduos seguem uma linha reta: normalidade razoável
- Desvios sistemáticos sugerem não normalidade

## Não normalidade

``` r
set.seed(123)

# Tratamentos
tratamento <- rep(c("A", "B", "C", "D"), each = 5)
nível <- as.numeric(factor(tratamento))  # A = 1, ..., D = 4

# Geração de resposta com erro assimétrico (distribuição exponencial)
resposta <- 5 + 0.8 * nível + rexp(20, rate = 1.5)

# Monta data.frame
dados_nnorm <- data.frame(tratamento, resposta)

# Ajusta o modelo
modelo <- aov(resposta ~ tratamento, data = dados_nnorm)

# Calcula resíduos padronizados
residuos_padronizados <- rstandard(modelo)

# QQ-plot com resíduos padronizados
qqnorm(residuos_padronizados,
       main = "QQ-plot dos Resíduos Padronizados",
       ylab = "Resíduos Padronizados",
       xlab = "Quantis teóricos",
       pch = 19, col = "darkblue")
qqline(residuos_padronizados, col = "red", lwd = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-12-1.png" width="672" />

## Condição de normalidade

``` r
set.seed(123)

# Tratamentos (fator com 4 níveis)
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Geração da resposta com erros normais
# Diferença entre os tratamentos, mas com erro ~ N(0,1)
resposta <- rep(c(5, 6, 7, 8), each = 5) + rnorm(20, mean = 0, sd = 1)

# Monta o data frame
dados_normais <- data.frame(tratamento, resposta)

# Ajusta o modelo de ANOVA
modelo_norm <- aov(resposta ~ tratamento, data = dados_normais)

# Calcula resíduos padronizados
residuos_padronizados <- rstandard(modelo_norm)

# QQ-plot dos resíduos padronizados
qqnorm(residuos_padronizados,
       main = "QQ-plot dos Resíduos Padronizados (Normalidade)",
       ylab = "Resíduos Padronizados",
       xlab = "Quantis teóricos",
       pch = 19, col = "darkgreen")
qqline(residuos_padronizados, col = "black", lwd = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-13-1.png" width="672" />

# Resíduos vs Fatores

- Verificar se os resíduos estão uniformemente distribuídos entre os níveis do fator
- Detectar violações de pressupostos da ANOVA relacionadas à homogeneidade de variância e à independência dos erros
- Avaliar se o modelo está bem ajustado para cada grupo/fator

## Violação de independência de resíduos

``` r
set.seed(123)

# Simula tratamentos em DIC
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Resposta média por tratamento
mu <- c(5, 6, 7, 8)

# Número total de observações
n <- length(tratamento)

# Simula resíduos autocorrelacionados (AR(1)) com phi = 0.7
phi <- 0.95
epsilon <- numeric(n)
epsilon[1] <- rnorm(1)
for (i in 2:n) {
  epsilon[i] <- phi * epsilon[i-1] + rnorm(1)
}

# Gera resposta com efeito do tratamento + erros autocorrelacionados
resposta <- rep(mu, each = 5) + epsilon

# Ajusta modelo ANOVA (pressupõe independência)
modelo <- aov(resposta ~ tratamento)

# Obtém resíduos
residuos <- resid(modelo)

# Plota resíduos na ordem da coleta para verificar autocorrelação
plot(residuos, type = "o", pch = 19, col = "blue",
     main = "Resíduos em Ordem Temporal (Violação da Independência)",
     xlab = "Ordem da Observação", ylab = "Resíduos")
abline(h = 0, col = "red", lty = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-14-1.png" width="672" />

<div class="notes">

- Padrão sequencial ou tendência suave:

Os resíduos não aparecem espalhados aleatoriamente. Em vez disso, eles formam uma curva ou uma sequência onde valores próximos na ordem das observações são semelhantes.

- Autocorrelação positiva:

Pontos consecutivos tendem a estar próximos uns dos outros, ou seja, se um resíduo é alto (positivo), o próximo também costuma ser alto. Isso cria um “arrasto” ou padrão ondulado no gráfico.

- Ausência de dispersão aleatória:

Em vez de oscilar livremente em torno do zero, os resíduos ficam agrupados, formando blocos ou séries que parecem “suavizadas”.

- Possível padrão cíclico ou periódico:

Em alguns casos, pode surgir um padrão repetitivo, indicando correlações estruturadas no tempo ou espaço.

</div>

## Heterocedasticidade

``` r
set.seed(123)

# Tratamentos em DIC
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Médias por tratamento
mu <- c(5, 6, 7, 8)

# Número total de observações
n <- length(tratamento)

# Simula resíduos com variância crescente (heterocedasticidade)
epsilon <- rnorm(n, mean = 0, sd = seq(0.2, 2, length.out = n))

# Resposta com efeito do tratamento + resíduos heterocedásticos
resposta <- rep(mu, each = 5) + epsilon

# Ajusta modelo ANOVA
modelo <- aov(resposta ~ tratamento)

# Resíduos do modelo
residuos <- resid(modelo)

# Plot resíduos em ordem temporal
plot(residuos, type = "o", pch = 19, col = "purple",
     main = "Resíduos em Ordem Temporal (Heterocedasticidade)",
     xlab = "Ordem das Observações", ylab = "Resíduos")
abline(h = 0, col = "blue", lty = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-15-1.png" width="672" />

## Sem violação de independência

``` r
set.seed(123)

# Tratamentos em DIC
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Médias por tratamento
mu <- c(5, 6, 7, 8)

# Número total de observações
n <- length(tratamento)

# Resíduos independentes (ruído branco)
epsilon <- rnorm(n, mean = 0, sd = 1)

# Resposta com efeito do tratamento + erros independentes
resposta <- rep(mu, each = 5) + epsilon

# Ajusta modelo ANOVA
modelo <- aov(resposta ~ tratamento)

# Resíduos do modelo
residuos <- resid(modelo)

# Plot resíduos em ordem temporal
plot(residuos, type = "o", pch = 19, col = "darkgreen",
     main = "Resíduos em Ordem Temporal (Independência)",
     xlab = "Ordem das Observações", ylab = "Resíduos")
abline(h = 0, col = "blue", lty = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-16-1.png" width="672" />

# Gráfico de Cook

- **Eixo X:** Índice das observações (número da observação)
- **Eixo Y:** Valores da distância de Cook para cada observação
- **Representação:** Linhas verticais indicam o valor da distância de Cook por ponto

## Gráfico de Cook

- **Linha de referência:**
  - Geralmente traçada em `\(\frac{4}{n - p}\)`, onde:
    - `\(n\)` = número total de observações  
    - `\(p\)` = número de parâmetros do modelo (incluindo intercepto)  
  - Pontos acima dessa linha são considerados **influentes**

## Gráfico de Cook

- **Objetivo:**
  - Identificar observações que exercem influência desproporcional no ajuste do modelo
  - Detectar possíveis **outliers** ou pontos atípicos que podem afetar a estimação dos coeficientes

## Gráfico de Cook

- **Interpretação:**
  - Valores pequenos indicam observações com pouca influência  
  - Valores grandes sugerem que a remoção do ponto causaria mudança significativa nos coeficientes do modelo
- **Utilidade prática:**
  - Permite decidir se é necessário investigar, corrigir ou remover observações influentes para melhorar o ajuste e validade do modelo

## Pontos influentes

``` r
set.seed(123)

# Tratamentos em DIC
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Médias por tratamento
mu <- c(5, 6, 7, 8)

# Resposta simulada com um ponto influente
resposta <- rep(mu, each = 5) + rnorm(length(tratamento), mean = 0, sd = 1)

# Inserir um ponto influente artificialmente (outlier extremo)
resposta[3] <- resposta[3] + 10  # um grande valor para influenciar o modelo

# Ajusta modelo ANOVA
modelo <- aov(resposta ~ tratamento)

# Calcula distância de Cook
cook_dist <- cooks.distance(modelo)

# Plot distância de Cook
plot(cook_dist, type = "h", lwd = 2, col = ifelse(cook_dist > 4/(length(cook_dist)-length(mu)), "red", "black"),
     main = "Distância de Cook com Ponto Influente",
     xlab = "Índice da Observação", ylab = "Distância de Cook")
abline(h = 4/(length(cook_dist)-length(mu)), col = "blue", lty = 2)

# Destacar os índices dos pontos influentes
influentes <- which(cook_dist > 4/(length(cook_dist)-length(mu)))
text(influentes, cook_dist[influentes], labels = influentes, pos = 3, col = "red")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-17-1.png" width="672" />

<div class="notes">

- O ponto com índice 3 foi alterado para ser um outlier extremo
- No gráfico, ele aparecerá com uma barra vermelha acima da linha azul de referência
- O índice do ponto influente será exibido no gráfico para facilitar a identificação

</div>

## Sem pontos influentes

``` r
set.seed(6)

# Tratamentos em DIC
tratamento <- rep(c("A", "B", "C", "D"), each = 5)

# Médias por tratamento
mu <- c(5, 5, 5, 5)

# Resposta simulada sem outliers (erro normal com desvio padrão padrão)
resposta <- rep(mu, each = 5) + rnorm(length(tratamento), mean = 0, sd = 0.5)

# Ajusta modelo ANOVA
modelo <- aov(resposta ~ tratamento)

# Calcula distância de Cook
cook_dist <- cooks.distance(modelo)

# Plot distância de Cook
plot(cook_dist, type = "h", lwd = 2, col = "darkgreen",
     main = "Distância de Cook sem Pontos Influentes",
     xlab = "Índice da Observação", ylab = "Distância de Cook",
     ylim = c(0, 0.3))
abline(h = 4/(length(cook_dist)-length(mu)), col = "blue", lty = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-18-1.png" width="672" />

# Testes na análise de resíduos

## Normalidade dos Resíduos

- **Testes comuns**:
  - `shapiro.test(residuos)`
  - `ad.test(residuos)` *(pacote `nortest`)*
  - `lillie.test(residuos)` *(pacote `nortest`)*
  - `jarque.bera.test(residuos)` *(pacote `tseries`)*
- **Hipótese**:
  - H₀: Os resíduos seguem distribuição normal
  - p \> 0,05 → normalidade não rejeitada

## Homocedasticidade (Igualdade de variâncias)

- **Testes comuns**:
  - `bartlett.test(resposta ~ tratamento)`
  - `leveneTest(resposta ~ tratamento)` *(pacote `car`)*
  - `fligner.test(resposta ~ tratamento)`
- **Hipótese**:
  - H₀: Variâncias são iguais entre os grupos
  - p \> 0,05 → homogeneidade mantida

------------------------------------------------------------------------

## Independência dos Resíduos

- **Teste mais usado**:
  - `durbinWatsonTest(modelo)` *(pacote `car` ou `lmtest`)*
- **Hipótese**:
  - H₀: Os resíduos são independentes
  - p \> 0,05 → independência mantida

------------------------------------------------------------------------

## Linearidade do Modelo

- **Não há teste formal.**
- Verificação **visual**:
  - Gráfico de resíduos vs valores ajustados
  - Gráfico de resíduos vs preditores
- **Indícios de violação**:
  - Padrões em forma de “U”, “∩”, ou outros

# Retornando ao Exemplo do braço robótico

``` r
# Se necessário, instale
# install.packages(c("car", "nortest", "lmtest"))

library(car)
library(nortest)
library(lmtest)

# Níveis do fator
tratamento <- rep(c("PID", "AutoPID", "Fuzzy", "LQR"), each = 5)

# Resposta simulada (erro médio absoluto)
ema <- c(
  rnorm(5, mean = 1.2, sd = 0.1),  # PID
  rnorm(5, mean = 1.0, sd = 0.1),  # AutoPID
  rnorm(5, mean = 0.8, sd = 0.15), # Fuzzy
  rnorm(5, mean = 0.9, sd = 0.12)  # LQR
)

# Monta data.frame
dados <- data.frame(Tratamento = tratamento, EMA = ema)

# Ajusta o modelo DIC
modelo <- aov(EMA ~ Tratamento, data = dados)

# Resíduos do modelo
residuos <- residuals(modelo)

# Teste de Shapiro-Wilk (Normalidade)
shapiro.test(residuos)

# Outros testes (opcional)
ad.test(residuos)        # Anderson-Darling
lillie.test(residuos)    # Lilliefors

# Teste de Bartlett (Homogeneidade)
bartlett.test(EMA ~ Tratamento, data = dados)

# Teste de Levene (mais robusto)
leveneTest(EMA ~ Tratamento, data = dados)

# Teste de Durbin-Watson Independência
durbinWatsonTest(modelo)
```

## Retornando ao Exemplo do braço robótico

    ## Carregando pacotes exigidos: carData

    ## 
    ## Anexando pacote: 'car'

    ## O seguinte objeto é mascarado por 'package:dplyr':
    ## 
    ##     recode

    ## Carregando pacotes exigidos: zoo

    ## 
    ## Anexando pacote: 'zoo'

    ## Os seguintes objetos são mascarados por 'package:base':
    ## 
    ##     as.Date, as.Date.numeric

    ## 
    ## 	Shapiro-Wilk normality test
    ## 
    ## data:  residuos
    ## W = 0.92686, p-value = 0.1344

    ## Warning in leveneTest.default(y = y, group = group, ...): group coerced to
    ## factor.

    ## Levene's Test for Homogeneity of Variance (center = median)
    ##       Df F value Pr(>F)
    ## group  3  0.0379 0.9897
    ##       16

    ##  lag Autocorrelation D-W Statistic p-value
    ##    1      -0.2229153       2.31998   0.988
    ##  Alternative hypothesis: rho != 0

## Retornando ao Exemplo do braço robótico

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-21-1.png" width="672" />

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
