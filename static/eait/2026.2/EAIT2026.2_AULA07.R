######################################################################
# AULA 07 - GRAFICOS EM R
# DISCIPLINA: EAIT
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/eait
######################################################################
  
# Objetivo:
# Demonstrar os principais sistemas gráficos do R:
# - Base R
# - ggplot2
# - plotly
# - outros pacotes graficos
###############################################################

###############################################################
# 1. GRAFICOS NO BASE R
###############################################################

# O Base R ja acompanha a instalacao do R.
# Nao eh necessario instalar pacotes adicionais.

###############################################################
# 1.1 Grafico de dispersao
###############################################################

# Criando vetores de dados
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 6)

# Construindo grafico de dispersão simples
plot(x, y)

###############################################################
# 1.2 Personalizando graficos
###############################################################

plot(
  x, y,
  
  # Título do grafico
  main = "Gráfico de Dispersão",
  
  # Nome do eixo X
  xlab = "Variável X",
  
  # Nome do eixo Y
  ylab = "Variável Y",
  
  # Tipo de simbolo
  pch = 10,
  
  # Cor dos pontos
  col = "blue",
  
  # Tamanho dos pontos
  cex = 0.5
)

###############################################################
# 1.3 Tipos graficos
###############################################################

# Criando sequencia
x <- 1:10

# Elevando ao quadrado
y <- x^2

# Grafico de linhas
plot(
  x, y,
  type = "h",   # l = lines
  lwd = 2,       # espessura da linha
  pch = 19
)

###############################################################
# 1.4 Histograma
###############################################################

# Gerando dados aleatorios da distribuicao normal
dados <- rnorm(100)

# Construindo histograma
hist(
  dados,
  
  # Cor das barras
  col = "lightblue",
  
  # Cor da borda
  border = "white",
  
  # Titulo
  main = "Histograma",
  
  # Nome eixo X
  xlab = "Valores"
)

library(leem)
dados |>
  new_leem(variable = 2) |>
  hist(barcol = "lightblue", bgcol = "black")


###############################################################
# 1.5 Boxplot
###############################################################

# Criando grupos
grupo <- rep(c("A", "B"), each = 50)

# Gerando valores aleatorios
valor <- rnorm(100)

# Construindo boxplot
boxplot(
  valor ~ grupo,
  
  # Cores das caixas
  col = c("orange", "lightgreen"),
  
  # Título
  main = "Boxplot por Grupo"
)

###############################################################
# 1.6 Barplot
###############################################################

# Vetor de frequencias
valores <- c(10, 15, 8)

# Construindo grafico de barras
barplot(
  valores,
  
  # Nomes das barras
  names.arg = c("A", "B", "C"),
  
  # Cor das barras
  col = heat.colors(3),
  
  # Titulo
  main = "Barplot"
)

###############################################################
# 2. INSTALANDO PACOTES
###############################################################

# Instale apenas uma vez

# install.packages("ggplot2")
# install.packages("plotly")
# install.packages("lattice")
# install.packages("highcharter")
# install.packages("leaflet")

###############################################################
# 3. GGPLOT2
###############################################################

# O pacote ggplot2 implementa a ideia de
# "Grammar of Graphics" (Gramatica de Graficos).
#
# A ideia central eh que um grafico pode ser construido
# combinando diferentes componentes:
#
#   DADOS
#     +
#   MAPEAMENTOS
#     +
#   GEOMETRIAS
#     +
#   CAMADAS
#     +
#   ESCALAS
#     +
#   FACETAS
#     +
#   COORDENADAS
#     +
#   TEMA
#     =
#   GRÁFICO
#
# Em vez de pensar em graficos como comandos isolados,
# o ggplot2 permite construir um grafico por partes.


###############################################################
# 3.1 Carregando o pacote
###############################################################

library(ggplot2)


###############################################################
# 3.2 A estrutura basica do ggplot2
###############################################################

# A estrutura fundamental pode ser representada por:

# ggplot(DADOS, aes(MAPEAMENTOS)) +
#   geom_XXX() + 

# Onde:
#
# ggplot()  -> inicia a construcao do grafico
#
# DADOS     -> conjunto de dados utilizado
#
# aes()     -> define os mapeamentos esteticos
#
# geom_XXX() -> define a geometria utilizada
#
# +         -> adiciona novas camadas ao grafico


###############################################################
# 3.3 Criando uma base de dados
###############################################################

dados <- data.frame(
  x = 1:10,
  y = c(2, 5, 4, 6, 8, 7, 9, 10, 12, 11)
)

dados


###############################################################
# 3.4 O conceito de DADOS
###############################################################

# O primeiro componente da gramatica eh o conjunto de dados.

ggplot(data = dados)


# Ainda nao temos um grafico propriamente dito.
#
# Apenas informamos ao ggplot2:
#
# "Utilize o objeto dados como fonte de informacoes."


###############################################################
# 3.5 O conceito de MAPEAMENTO
###############################################################

# O segundo componente eh o mapeamento estetico.
#
# O mapeamento eh definido pela funcao aes().
#
# aes() vem de "aesthetic mappings".

aes(x = x, y = y)


# Estamos estabelecendo uma relacao entre as variaveis
# dos dados e caracteristicas visuais do grafico.
#
# Neste caso:
#
# variável x -> posição horizontal
# variável y -> posição vertical


###############################################################
# 3.6 Primeiro grafico
###############################################################

ggplot(
  data = dados,
  aes(x = x, y = y)
) +
  geom_point(col = "red")


# Podemos interpretar o codigo como:
#
# 1. Utilize os dados armazenados em "dados";
#
# 2. Mapeie a variavel x para o eixo X;
#
# 3. Mapeie a variavel y para o eixo Y;
#
# 4. Represente as observacoes utilizando pontos.


###############################################################
# 3.7 Forma simplificada
###############################################################

# Como "data" e "aes" sao argumentos principais de ggplot(),
# podemos escrever:


ggplot(dados, aes(x, y)) +
  geom_point()

dados2 <- dados
names(dados2)  <- c("w", "z")

ggplot(dados2, aes(w, z)) +
  geom_point()

###############################################################
# 3.8 O conceito de GEOMETRIA
###############################################################

# A funcao geom_*() determina como os dados
# serão representados graficamente.
#
# Alguns exemplos:
#
# geom_point()      -> pontos
# geom_line()       -> linhas
# geom_histogram()  -> histograma
# geom_boxplot()    -> boxplot
# geom_bar()        -> barras
# geom_col()        -> colunas
# geom_density()    -> densidade
# geom_smooth()     -> curva de tendência


###############################################################
# 3.9 Alterando a geometria
###############################################################

# Os mesmos dados podem ser representados
# utilizando diferentes geometrias.


# Pontos

ggplot(dados, aes(x, y)) +
  geom_point()


# Linhas

ggplot(dados, aes(x, y)) +
  geom_line()


# Pontos e linhas

ggplot(dados, aes(x, y)) +
  geom_point() +
  geom_line()


# Observe:
#
# Os DADOS continuam os mesmos.
#
# O que mudou foi a GEOMETRIA utilizada
# para representar esses dados.


###############################################################
# 3.10 O operador +
###############################################################

# No ggplot2, o operador + eh utilizado para
# adicionar novas camadas ao grafico.

ggplot(dados, aes(x, y)) +
  geom_point() +
  geom_line()


# Podemos pensar no gráfico como:

# ggplot()
#    |
#    +-- geom_point()
#    |
#    +-- geom_line()


# Portanto, o operador + nao representa uma
# soma matematica.
#
# Ele representa a adicao de uma nova camada.


###############################################################
# 3.11 Construindo um grafico por camadas
###############################################################

ggplot(dados, aes(x, y)) +
  
  # Primeira camada:
  # pontos
  geom_point() +
  
  # Segunda camada:
  # linha
  geom_line()


# Podemos continuar adicionando componentes:

ggplot(dados, aes(x, y)) +
  
  geom_point() +
  
  geom_line() +
  
  labs(
    title = "Relação entre X e Y",
    x = "Variável X",
    y = "Variável Y"
  ) +
  
  theme_classic()


###############################################################
# 3.12 Mapeamentos estéticos
###############################################################

# As esteticas são definidas dentro de aes().
#
# aes() estabelece uma relação entre:
#
#       VARIÁVEL DOS DADOS
#                ↓
#       CARACTERISTICA VISUAL
#
# Principais esteticas:
#
# x         -> posição horizontal
# y         -> posição vertical
# color     -> cor
# fill      -> preenchimento
# size      -> tamanho
# linewidth -> espessura da linha
# shape     -> forma
# alpha     -> transparência
# linetype  -> tipo de linha
# group     -> agrupamento
# label     -> texto




###############################################################
# 3.13 Exemplo de mapeamento de cor
###############################################################

dados2 <- data.frame(
  grupo = rep(c("A", "B"), each = 50),
  valor = rnorm(100)
)

ggplot(
  dados2,
  aes(
    x = grupo,
    y = valor,
    color = grupo
  )
) +
  geom_point()


# Neste caso:
#
# grupo -> eixo X
# valor -> eixo Y
# grupo -> cor dos pontos
#
# A cor esta sendo determinada pelos dados.


###############################################################
# 3.14 MAPEAMENTO x CONFIGURACAO
###############################################################

# Essa eh uma distincao muito importante no ggplot2.


# -------------------------------------------------------------
# CONFIGURACAO
# -------------------------------------------------------------

# Quando escrevemos:

ggplot(dados, aes(x, y)) +
  geom_point(color = "blue")


# Estamos dizendo:
#
# "Todos os pontos devem ser azuis."


# A cor nao depende de uma variavel.


# -------------------------------------------------------------
# MAPEAMENTO
# -------------------------------------------------------------

ggplot(
  dados2,
  aes(
    x = grupo,
    y = valor,
    color = grupo
  )
) +
  geom_point()


# Aqui a cor depende da variavel "grupo".
#
# Portanto:
#
# color = "blue"
#       -> configuracao
#
# aes(color = grupo)
#       -> mapeamento


###############################################################
# 3.15 Personalizando pontos
###############################################################

ggplot(dados, aes(x, y)) +
  
  geom_point(
    
    # Cor dos pontos
    color = "blue",
    
    # Tamanho dos pontos
    size = 3
  )


###############################################################
# 3.16 Adicionando linhas
###############################################################

ggplot(dados, aes(x, y)) +
  
  # Pontos
  geom_point(size = 3) +
  
  # Linha
  geom_line(linewidth = 1)


###############################################################
# 3.17 Rotulos do grafico
###############################################################

# A funcao labs() permite adicionar
# titulos e rotulos.

ggplot(dados, aes(x, y)) +
  
  geom_point(size = 3) +
  
  geom_line() +
  
  labs(
    title = "Relação entre X e Y",
    subtitle = "Exemplo utilizando ggplot2",
    x = "Variável X",
    y = "Variável Y"
  )


###############################################################
# 3.18 Titulos e legendas
###############################################################

ggplot(dados2, aes(grupo, valor, color = grupo)) +
  
  geom_point(size = 3) +
  
  labs(
    title = "Distribuição dos valores",
    x = "Grupo",
    y = "Valor",
    color = "Grupo"
  )


###############################################################
# 3.19 TEMAS
###############################################################

# Os temas controlam diversos aspectos da aparencia
# do grafico.

ggplot(dados, aes(x, y)) +
  
  geom_point(size = 3) +
  
  theme_classic()


###############################################################
# 3.20 theme_classic()
###############################################################

ggplot(dados, aes(x, y)) +
  geom_point(size = 3) +
  theme_classic()


###############################################################
# 3.21 Adicionando linhas aos eixos
###############################################################

ggplot(dados, aes(x, y)) +
  
  geom_point(size = 3) +
  
  theme_minimal() +
  
  theme(
    axis.line = element_line(
      color = "black",
      linewidth = 1
    )
  )


###############################################################
# 3.22 Adicionando apenas os eixos X e Y
###############################################################

ggplot(dados, aes(x, y)) +
  
  geom_point(size = 3) +
  
  theme_minimal() +
  
  theme(
    axis.line.x = element_line(
      color = "black"
    ),
    
    axis.line.y = element_line(
      color = "black"
    )
  )


###############################################################
# 3.23 Exemplo completo
###############################################################

ggplot(dados, aes(x, y)) +
  
  # Geometria: pontos
  geom_point(
    size = 3,
    color = "black"
  ) +
  
  # Geometria: linha
  geom_line() +
  
  # Rotulos
  labs(
    title = "Gráfico com Eixos",
    x = "Eixo X",
    y = "Eixo Y"
  ) +
  
  # Tema
  theme_classic()


###############################################################
# 3.24 FACETAS
###############################################################

# Outro componente importante da gramatica de graficos
# eh a possibilidade de dividir o grafico em varios paineis.

# As principais funcoes sao:
#
# facet_wrap()
# facet_grid()


###############################################################
# 3.25 facet_wrap()
###############################################################

ggplot(dados2, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(~grupo)


# O símbolo ~ pode ser lido como:
#
# "por"


# Portanto:
#
# facet_wrap(~grupo)
#
# significa aproximadamente:
#
# "divida o gráfico por grupo."


###############################################################
# 3.26 Outro exemplo de facet_wrap()
###############################################################

dados3 <- data.frame(
  grupo = rep(c("A", "B", "C", "D"), each = 50),
  valor = rnorm(200)
)

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot(
    fill = "lightblue"
  ) +
  
  facet_wrap(~grupo)


###############################################################
# 3.27 Controlando o número de colunas
###############################################################

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(
    ~grupo,
    ncol = 1
  )


###############################################################
# 3.28 Controlando o número de linhas
###############################################################

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(
    ~grupo,
    nrow = 2
  )


###############################################################
# 3.29 Escalas livres
###############################################################

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(
    ~grupo,
    scales = "free"
  )


###############################################################
# 3.30 Facetas com grafico de dispersao
###############################################################

dados4 <- data.frame(
  x = rnorm(200),
  y = rnorm(200),
  grupo = rep(c("A", "B", "C", "D"), each = 50)
)

ggplot(dados4, aes(x, y)) +
  
  geom_point() +
  
  facet_wrap(~grupo)


###############################################################
# 3.31 Melhorando a aparencia
###############################################################

ggplot(dados4, aes(x, y)) +
  
  geom_point(
    color = "blue"
  ) +
  
  facet_wrap(~grupo) +
  
  theme_classic()


###############################################################
# 3.32 facet_grid()
###############################################################

# facet_grid() permite organizar os gráficos
# em linhas e colunas.

dados5 <- data.frame(
  sexo = rep(c("M", "F"), each = 100),
  tratamento = rep(c("A", "B"), 100),
  valor = rnorm(200)
)

ggplot(
  dados5,
  aes(
    tratamento,
    valor
  )
) +
  
  geom_boxplot() +
  
  facet_grid(
    sexo ~ tratamento
  )


# A estrutura:
#
# facet_grid(linhas ~ colunas)
#
# significa:
#
# sexo       -> linhas
# tratamento -> colunas


###############################################################
# 3.33 A gramática de gráficos em resumo
###############################################################

# Um gráfico no ggplot2 pode ser pensado como:

# -------------------------------------------------------------
# DADOS
# -------------------------------------------------------------

# Qual conjunto de dados será utilizado?


# -------------------------------------------------------------
# MAPEAMENTOS
# -------------------------------------------------------------

# Quais variáveis serão associadas
# às características visuais?

# aes(x, y)
# aes(color = grupo)
# aes(size = valor)
# aes(shape = grupo)


# -------------------------------------------------------------
# GEOMETRIAS
# -------------------------------------------------------------

# Como os dados serão representados?

# geom_point()
# geom_line()
# geom_histogram()
# geom_boxplot()
# geom_bar()


# -------------------------------------------------------------
# CAMADAS
# -------------------------------------------------------------

# O que mais pode ser acrescentado?

# geom_point()
# geom_line()
# labs()
# geom_smooth()


# -------------------------------------------------------------
# FACETAS
# -------------------------------------------------------------

# Precisamos dividir o gráfico em painéis?

# facet_wrap()
# facet_grid()


# -------------------------------------------------------------
# ESCALAS
# -------------------------------------------------------------

# Como os valores serão apresentados nos eixos,
# cores, tamanhos etc.?

# scale_x_...
# scale_y_...
# scale_color_...


# -------------------------------------------------------------
# COORDENADAS
# -------------------------------------------------------------

# Como o sistema de coordenadas será organizado?

# coord_cartesian()
# coord_flip()
# coord_fixed()


# -------------------------------------------------------------
# TEMA
# -------------------------------------------------------------

# Como será a aparência do gráfico?

# theme_classic()
# theme_minimal()
# theme_bw()
# theme()


###############################################################
# 3.34 A "receita mental" do ggplot2
###############################################################

# Para construir um gráfico, pense:

# 1. Quais são os meus DADOS?
#
# 2. Quais variáveis quero representar?
#
# 3. Como essas variáveis serão MAPEADAS?
#
# 4. Qual GEOMETRIA representa melhor os dados?
#
# 5. Preciso adicionar outras CAMADAS?
#
# 6. Preciso dividir o gráfico em FACETAS?
#
# 7. Preciso modificar as ESCALAS?
#
# 8. Preciso modificar as COORDENADAS?
#
# 9. Como quero PERSONALIZAR o gráfico?


###############################################################
# 3.35 Estrutura geral
###############################################################

# A estrutura pode ser resumida como:

# ggplot(DADOS, aes(MAPEAMENTOS)) +
#   GEOMETRIA() +
#   CAMADA() +
#   FACETAS() +
#   ESCALAS() +
#   COORDENADAS() +
#   TEMA()


###############################################################
# 3.36 Exemplo final
###############################################################

ggplot(
  dados4,
  aes(
    x = x,
    y = y,
    color = grupo
  )
) +
  
  # Geometria principal
  geom_point(
    size = 3
  ) +
  
  # Linha de tendência
  geom_smooth(
    method = "lm",
    se = FALSE
  ) +
  
  # Divisão em painéis
  facet_wrap(~grupo) +
  
  # Rótulos
  labs(
    title = "Relação entre X e Y",
    subtitle = "Construção utilizando a gramática de gráficos",
    x = "Variável X",
    y = "Variável Y",
    color = "Grupo"
  ) +
  
  # Tema
  theme_classic()


###############################################################
# 4. PLOTLY
###############################################################

# Carregando pacote
library(plotly)

###############################################################
# 4.1 Gráfico interativo
###############################################################

plot_ly(
  
  # Valores eixo X
  x = c(1, 2, 3, 4),
  
  # Valores eixo Y
  y = c(10, 15, 13, 20),
  
  # Tipo gráfico
  type = "scatter",
  
  # Linha + pontos
  mode = "lines+markers"
)

###############################################################
# 4.2 Convertendo ggplot em interativo
###############################################################

# Criando gráfico ggplot
g <- ggplot(dados, aes(x, y)) +
  
  geom_point(size = 3)

# Tornando interativo
ggplotly(g)

###############################################################
# 5. LATTICE
###############################################################

# Carregando pacote
library(lattice)

# Construindo gráfico
xyplot(y ~ x, data = dados)

###############################################################
# 6. HIGHCHARTER
###############################################################

# Carregando pacote
library(highcharter)

# Estrutura basica
highchart()


# Definindo o tipo de grafico
## linha
highchart() |>
  
  hc_add_series(
    data = c(1, 3, 2, 5),
    type = "line"
  )

## Barra
highchart() |>
  
  hc_add_series(
    data = c(1, 3, 2, 5),
    type = "column"
  )

## Area
highchart() |>
  
  hc_add_series(
    data = c(1, 3, 2, 5),
    type = "area"
  )

## Adicionando titulo
highchart() |>
  
  hc_title(
    text = "Produção Mensal"
  ) |>
  
  hc_add_series(
    data = c(1, 3, 2, 5),
    type = "line"
  )

## Personalizando eixos
highchart() |>
  
  hc_title(text = "Produção") |>
  
  hc_xAxis(
    title = list(text = "Meses")
  ) |>
  
  hc_yAxis(
    title = list(text = "Quantidade")
  ) |>
  
  hc_add_series(
    data = c(2, 5, 8, 10),
    type = "line"
  )

## Adicionando categorias
meses <- c("Jan", "Fev", "Mar", "Abr")

highchart() |>
  
  hc_xAxis(
    categories = meses
  ) |>
  
  hc_add_series(
    data = c(10, 12, 8, 15),
    type = "column"
  )

## multiplas series
### comparando grupos
highchart() |>
  
  hc_xAxis(
    categories = c("Jan", "Fev", "Mar", "Abr")
  ) |>
  
  hc_add_series(
    name = "Produto A",
    data = c(5, 8, 6, 9),
    type = "line"
  ) |>
  
  hc_add_series(
    name = "Produto B",
    data = c(4, 7, 10, 12),
    type = "line"
  )

### grafico de dispersao
dados <- data.frame(
  x = 1:10,
  y = c(2, 5, 4, 6, 8, 7, 9, 10, 12, 11)
)

highchart() |>
  
  hc_add_series(
    data = list_parse2(dados),
    type = "scatter",
    mapping = hcaes(x = x, y = y)
  )

## Grafico de pizza
highchart() |>
  
  hc_add_series(
    data = list(
      list(name = "A", y = 30),
      list(name = "B", y = 45),
      list(name = "C", y = 25)
    ),
    type = "pie"
  )

## Tooltips
### Tooltips são informações exibidas ao passar o mouse.
highchart() |>
  
  hc_add_series(
    data = c(2, 5, 8, 10),
    type = "line"
  ) |>
  
  hc_tooltip(
    pointFormat = "Valor: {point.y}"
  )

## Alterando cores
highchart() |>
  
  hc_add_series(
    data = c(3, 5, 7, 9),
    type = "column",
    color = "steelblue"
  )

## Temas
### Escuro
highchart() |>
  
  hc_add_series(
    data = c(1, 3, 2, 5)
  ) |>
  
  hc_add_theme(
    hc_theme_darkunica()
  )

## Zoom
highchart() |>
  
  hc_chart(
    zoomType = "x"
  ) |>
  
  hc_add_series(
    data = c(2, 5, 8, 10, 12, 15),
    type = "line"
  )

# Gráficos interativos avançados
# 
# O highcharter permite:
#   
#   zoom;
# hover;
# exportação;
# animações;
# seleção;
# navegação;
# dashboards.

###############################################################
# 7. LEAFLET
###############################################################

# Carregando pacote
library(leaflet)

# Criando mapa interativo
leaflet() |>
  
  addTiles()

# O que aconteceu?
## `leaflet()`
# => Cria o objeto mapa.
## `addTiles()`
# => Adiciona o mapa base.
# Por padrão usa:
#  * OpenStreetMap.
# O `leaflet` trabalha em camadas.
# 
# A lógica é:
#   
#   | Camada     | Função        |
#   | ---------- | ------------- |
#   | mapa base  | ruas/satélite |
#   | marcadores | pontos        |
#   | polígonos  | regiões       |
#   | linhas     | trajetos      |
#   | controles  | menus         |
#   | popups     | informações   |

# Exemplo: Minas Gerais e Ouro Branco
# Agora vamos criar um exemplo mais interessante.
# 
# A ideia será:
#   
#   * centralizar o mapa em Minas Gerais;
# * destacar a cidade de Ouro Branco;
# * adicionar marcador;
# * adicionar popup;
# * desenhar círculo de destaque.
library(leaflet)

# Coordenadas de Ouro Branco
lat <- -20.5236
lon <- -43.6949

leaflet() |>
  
  # Mapa base
  addTiles() |>
  
  # Centralizando em Minas Gerais
  setView(
    lng = lon,
    lat = lat,
    zoom = 8
  ) |>
  
  # Adicionando marcador
  addMarkers(
    lng = lon,
    lat = lat,
    
    # Texto popup
    popup = "Ouro Branco - Minas Gerais"
  ) |>
  
  # Adicionando círculo de destaque
  addCircles(
    lng = lon,
    lat = lat,
    
    radius = 15000,
    
    color = "red",
    
    fillOpacity = 0.3
  )

## Melhorando o mapa
leaflet() |>
  
  addProviderTiles(
    providers$Esri.WorldImagery
  ) |>
  
  setView(
    lng = -43.6949,
    lat = -20.5236,
    zoom = 10
  ) |>
  
  addMarkers(
    lng = -43.6949,
    lat = -20.5236,
    popup = "Ouro Branco"
  )

## O `leaflet` suporta vários provedores.

### addTiles() # OpenStreetMap

### addProviderTiles( # Satélite
###   providers$Esri.WorldImagery
### )

### addProviderTiles( # CartoDB
###   providers$CartoDB.Positron
### )

### addProviderTiles( # Terreno
###  providers$Stamen.Terrain
### )


## Adicionando rótulos
leaflet() |>
  
  addTiles() |>
  
  addMarkers(
    lng = -43.6949,
    lat = -20.5236,
    
    label = "Ouro Branco"
  )

# Adicionando multiplas cidades
cidades <- data.frame(
  nome = c("Ouro Branco", "Belo Horizonte"),
  lat = c(-20.5236, -19.9167),
  lon = c(-43.6949, -43.9345)
)

leaflet(cidades) |>
  
  addTiles() |>
  
  addMarkers(
    lng = ~lon,
    lat = ~lat,
    popup = ~nome
  )

# Exemplo completo
library(leaflet)

# Coordenadas de Ouro Branco
lat <- -20.5236
lon <- -43.6949

leaflet() |>
  
  # Mapa base
  addProviderTiles(
    providers$CartoDB.Positron
  ) |>
  
  # Centralização
  setView(
    lng = lon,
    lat = lat,
    zoom = 9
  ) |>
  
  # Marcador
  addMarkers(
    lng = lon,
    lat = lat,
    
    popup = paste(
      "<b>Ouro Branco</b><br>",
      "Estado de Minas Gerais"
    )
  ) |>
  
  # Círculo de destaque
  addCircles(
    lng = lon,
    lat = lat,
    
    radius = 20000,
    
    color = "red",
    
    fillColor = "red",
    
    fillOpacity = 0.2
  )

#########################################################
# 8. Criando mapas baseados em dados como PIB, renda, etc
#########################################################
library(sidrar)
library(geobr)
library(ggplot2)
library(dplyr)
library(scales)


## Obtendo dados do SIDRA
# => População estimada dos estados

# Dados SIDRA
pop <- get_sidra(
  x = 6579,
  variable = 9324,
  geo = "State",
  period = "last"
)

# -------------------------
# Mapa dos estados
# -------------------------

estados <- read_state()

# -------------------------
# Ajustando base
# -------------------------

pop <- pop |>
  
  rename(
    code_state = `Unidade da Federação (Código)`,
    populacao = Valor
  )

pop$code_state <- as.numeric(pop$code_state)

# -------------------------
# Join
# -------------------------

mapa <- estados |>
  
  left_join(
    pop,
    by = "code_state"
  )

# -------------------------
# Criando rótulos
# -------------------------

mapa$rotulo <- comma(
  mapa$populacao,
  big.mark = ".",
  decimal.mark = ","
)

# -------------------------
# Mapa
# -------------------------

ggplot(mapa) +
  
  # Estados
  geom_sf(
    aes(fill = populacao),
    color = "white"
  ) +
  
  # Texto
  geom_sf_text(
    aes(label = rotulo),
    size = 3
  ) +
  
  scale_fill_viridis_c(
    option = "plasma",
    labels = comma
  ) +
  
  labs(
    title = "População por Estado",
    subtitle = "Dados do IBGE/SIDRA",
    fill = "População"
  ) +
  
  theme_minimal()




###############################################################
# 9. EXPORTANDO GRÁFICOS
###############################################################

###############################################################
# 8.1 Exportando no Base R
###############################################################

# Abrindo dispositivo PNG
png("grafico_base.png")

# Construindo gráfico
plot(x, y)

# Fechando dispositivo
dev.off()

###############################################################
# 8.2 Exportando no ggplot2
###############################################################

# Criando gráfico
g <- ggplot(dados, aes(x, y)) +
  geom_point()

# Salvando gráfico
ggsave(
  filename = "grafico_ggplot.png",
  plot = g
)

###############################################################
# 9. EXERCÍCIOS
###############################################################

###############################################################
# Exercício 1
# Construir um histograma com 200 observações
###############################################################

dados <- rnorm(200)

hist(dados)

###############################################################
# Exercício 2
# Construir gráfico de dispersão
###############################################################

x <- rnorm(50)
y <- rnorm(50)

plot(x, y)

###############################################################
# Exercício 3
# Construir gráfico ggplot2 com tema
###############################################################

dados <- data.frame(
  x = 1:20,
  y = rnorm(20)
)

ggplot(dados, aes(x, y)) +
  
  geom_line() +
  
  theme_classic()

