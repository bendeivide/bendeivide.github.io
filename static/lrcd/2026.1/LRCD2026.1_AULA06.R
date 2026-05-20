###############################################################
# AULA 06 - GRÁFICOS EM R
# DISCIPLINA: LRCD
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/rcd
###############################################################
# Objetivo:
# Demonstrar os principais sistemas gráficos do R:
# - Base R
# - ggplot2
# - plotly
# - outros pacotes gráficos
###############################################################

###############################################################
# 1. GRÁFICOS NO BASE R
###############################################################

# O Base R já acompanha a instalação do R.
# Não é necessário instalar pacotes adicionais.

###############################################################
# 1.1 Gráfico de dispersão
###############################################################

# Criando vetores de dados
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 6)

# Construindo gráfico de dispersão simples
plot(x, y)

###############################################################
# 1.2 Personalizando gráficos
###############################################################

plot(
  x, y,
  
  # Título do gráfico
  main = "Gráfico de Dispersão",
  
  # Nome do eixo X
  xlab = "Variável X",
  
  # Nome do eixo Y
  ylab = "Variável Y",
  
  # Tipo de símbolo
  pch = 19,
  
  # Cor dos pontos
  col = "blue",
  
  # Tamanho dos pontos
  cex = 1.5
)

###############################################################
# 1.3 Tipos gráficos
###############################################################

# Criando sequência
x <- 1:10

# Elevando ao quadrado
y <- x^2

# Gráfico de linhas
plot(
  x, y,
  type = "l",   # l = lines
  lwd = 2       # espessura da linha
)

###############################################################
# 1.4 Histograma
###############################################################

# Gerando dados aleatórios da distribuição normal
dados <- rnorm(100)

# Construindo histograma
hist(
  dados,
  
  # Cor das barras
  col = "lightblue",
  
  # Cor da borda
  border = "white",
  
  # Título
  main = "Histograma",
  
  # Nome eixo X
  xlab = "Valores"
)

###############################################################
# 1.5 Boxplot
###############################################################

# Criando grupos
grupo <- rep(c("A", "B"), each = 50)

# Gerando valores aleatórios
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

# Vetor de frequências
valores <- c(10, 15, 8)

# Construindo gráfico de barras
barplot(
  valores,
  
  # Nomes das barras
  names.arg = c("A", "B", "C"),
  
  # Cor das barras
  col = "lightblue",
  
  # Título
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

# Carregando pacote
library(ggplot2)

###############################################################
# 3.1 Estrutura básica do ggplot2
###############################################################

# Criando data.frame
dados <- data.frame(
  x = 1:10,
  y = c(2, 5, 4, 6, 8, 7, 9, 10, 12, 11)
)

# Gráfico de dispersão
ggplot(dados, aes(x, y)) +
  geom_point()

###############################################################
# 3.2 Personalizando pontos
###############################################################

ggplot(dados, aes(x, y)) +
  
  # Adicionando pontos
  geom_point(
    
    # Cor dos pontos
    color = "blue",
    
    # Tamanho
    size = 3
  )

###############################################################
# 3.3 Adicionando linhas
###############################################################

ggplot(dados, aes(x, y)) +
  
  # Pontos
  geom_point(size = 3) +
  
  # Linha
  geom_line(linewidth = 1)

###############################################################
# 3.4 Histograma no ggplot2
###############################################################

# Criando base de dados
dados_hist <- data.frame(
  x = rnorm(1000)
)

# Construindo histograma
ggplot(dados_hist, aes(x)) +
  
  geom_histogram(
    
    # Número de classes
    bins = 20,
    
    # Cor interna
    fill = "steelblue",
    
    # Cor da borda
    color = "white"
  )

###############################################################
# 3.5 Boxplot no ggplot2
###############################################################

# Criando banco de dados
dados2 <- data.frame(
  grupo = rep(c("A", "B"), each = 50),
  valor = rnorm(100)
)

# Construindo boxplot
ggplot(dados2, aes(grupo, valor, fill = grupo)) +
  
  geom_boxplot()

###############################################################
# 3.6 Temas gráficos
###############################################################

ggplot(dados, aes(x, y)) +
  
  geom_point(size = 3) +
  
  # Tema minimalista
  theme_classic()

## Usando theme_classic()

ggplot(dados, aes(x, y)) +
  geom_point(size = 3) +
  theme_classic()

## Adicionando linhas manualmente

ggplot(dados, aes(x, y)) +
  geom_point(size = 3) +
  
  theme_minimal() +
  
  theme(
    axis.line = element_line(
      color = "black",
      linewidth = 1
    )
  )

## Adicionando apenas eixo X e Y

ggplot(dados, aes(x, y)) +
  geom_point(size = 3) +
  
  theme_minimal() +
  
  theme(
    axis.line.x = element_line(color = "black"),
    axis.line.y = element_line(color = "black")
  )

## Exemplo completo

library(ggplot2)

dados <- data.frame(
  x = 1:10,
  y = c(2, 5, 4, 6, 8, 7, 9, 10, 12, 11)
)

ggplot(dados, aes(x, y)) +
  
  geom_point(
    size = 3,
    color = "black"
  ) +
  
  geom_line() +
  
  labs(
    title = "Gráfico com Eixos",
    x = "Eixo X",
    y = "Eixo Y"
  ) +
  
  theme_classic()

###############################################################
# 3.7 Facetas
###############################################################

ggplot(dados2, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  # Dividindo gráficos
  facet_wrap(~grupo) 

## Outro exemplo

dados3 <- data.frame(
  grupo = rep(c("A", "B", "C", "D"), each = 50),
  valor = rnorm(200)
)

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot(fill = "lightblue") +
  
  facet_wrap(~grupo)

## controlando o numero de colunas

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(
    ~grupo,
    ncol = 1
  )

## controlando o numero de linhas

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(
    ~grupo,
    nrow = 2
  )

## escalas livres

ggplot(dados3, aes(grupo, valor)) +
  
  geom_boxplot() +
  
  facet_wrap(
    ~grupo,
    scales = "free"
  )

## facetas com dispersao

dados4 <- data.frame(
  x = rnorm(200),
  y = rnorm(200),
  grupo = rep(c("A", "B", "C", "D"), each = 50)
)

ggplot(dados4, aes(x, y)) +
  
  geom_point() +
  
  facet_wrap(~grupo)

## melhorando aparencia

ggplot(dados4, aes(x, y)) +
  
  geom_point(color = "blue") +
  
  facet_wrap(~grupo) +
  
  theme_classic()

## facetas com grid

dados5 <- data.frame(
  sexo = rep(c("M", "F"), each = 100),
  tratamento = rep(c("A", "B"), 100),
  valor = rnorm(200)
)

ggplot(dados5, aes(tratamento, valor)) +
  
  geom_boxplot() +
  
  facet_grid(sexo ~ tratamento)

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

