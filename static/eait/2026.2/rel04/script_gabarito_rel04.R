######################################################################
# GABARITO — RELATÓRIO 4
# DISCIPLINA: ESTATÍSTICA APLICADA A INOVAÇÕES TECNOLÓGICAS (EAIT)
# TEMA: GRÁFICOS EM R APLICADOS À ENGENHARIA CIVIL
# Prof. Ben Deivide | UFSJ
######################################################################

# Objetivo:
# Servir de referência para correção do Relatório 4.
# Cada questão do relatório é resolvida e comentada.

# --------------------------------------------------------------------
# PREPARAÇÃO
# --------------------------------------------------------------------

# install.packages(c("ggplot2", "dplyr", "plotly",
#                    "highcharter", "leaflet", "scales"))

library(ggplot2)
library(dplyr)
library(plotly)
library(highcharter)
library(leaflet)
library(scales)

dados <- read.csv("dados_engenharia_civil.csv")

######################################################################
# ETAPA 1 — CONHECENDO A BASE
######################################################################

# --------------------------------------------------------------------
# Questão 1 — Importação e verificação inicial
# --------------------------------------------------------------------

head(dados)
tail(dados)
dim(dados)

# Comentário:
# A base foi importada corretamente com 300 observações e 11 variáveis.
# As primeiras e últimas linhas mostram valores coerentes com o contexto.

# --------------------------------------------------------------------
# Questão 2 — Número de observações e variáveis
# --------------------------------------------------------------------

n_obs <- nrow(dados)   # 300
n_var <- ncol(dados)   # 11

n_obs
n_var

# --------------------------------------------------------------------
# Questão 3 — Estrutura da base
# --------------------------------------------------------------------

str(dados)
dplyr::glimpse(dados)

# Comentário:
# Variáveis quantitativas: area_construida, custo_total, prazo_meses,
#   resistencia_mpa, consumo_cimento, indice_falhas, satisfacao.
# Variáveis qualitativas: tipo_obra, regiao, sustentavel.
# id_obra é um identificador inteiro (não é variável de análise).

# --------------------------------------------------------------------
# Questão 4 — Resumo das variáveis
# --------------------------------------------------------------------

summary(dados)

# Comentário:
# Os valores mínimo e máximo de custo_total e area_construida são
# compatíveis com obras reais. Não há valores negativos nem zeros
# absurdos. resistencia_mpa varia em torno de 32 MPa, coerente com
# concretos estruturais.

# --------------------------------------------------------------------
# Questão 5 — Valores ausentes
# --------------------------------------------------------------------

colSums(is.na(dados))

# Comentário:
# A base foi gerada com set.seed(2026) e não contém NA.
# Caso houvesse, cada variável deveria ser tratada individualmente.

######################################################################
# ETAPA 2 — GRÁFICOS NO BASE R
######################################################################

# --------------------------------------------------------------------
# Questão 6 — Dispersão: área construída × custo total
# --------------------------------------------------------------------

plot(
  dados$area_construida,
  dados$custo_total,
  main = "Área construída vs. Custo total",
  xlab = "Área construída (m²)",
  ylab = "Custo total (R$)",
  pch  = 19,
  col  = adjustcolor("steelblue", alpha.f = 0.6),
  cex  = 0.8
)
grid()

# Comentário:
# Há relação linear positiva clara: obras maiores tendem a custar mais.
# Existem pontos acima da nuvem principal, que podem ser outliers
# (obras de infraestrutura, que têm fator de custo mais alto).

# --------------------------------------------------------------------
# Questão 7 — Histograma: resistência do concreto
# --------------------------------------------------------------------

hist(
  dados$resistencia_mpa,
  breaks = 20,
  col    = "lightblue",
  border = "white",
  main   = "Distribuição da resistência do concreto",
  xlab   = "Resistência (MPa)"
)
abline(v = mean(dados$resistencia_mpa), col = "red", lwd = 2, lty = 2)
legend("topright", legend = "Média", col = "red", lty = 2, lwd = 2)

# Comentário:
# A distribuição é aproximadamente simétrica em torno de 32 MPa.
# Há valores abaixo de 25 MPa e acima de 40 MPa, que podem merecer
# investigação dependendo da classe de concreto esperada.

# --------------------------------------------------------------------
# Questão 8 — Boxplot: custo total por tipo de obra
# --------------------------------------------------------------------

boxplot(
  custo_total ~ tipo_obra,
  data = dados,
  col  = c("orange", "lightgreen", "lightblue", "plum"),
  main = "Custo total por tipo de obra",
  xlab = "Tipo de obra",
  ylab = "Custo total (R$)"
)

# Comentário:
# Infraestrutura apresenta a maior mediana de custo, seguida por
# Comercial, Residencial e Industrial. Industrial tem a menor mediana.
# Infraestrutura e Comercial apresentam maior dispersão.

# --------------------------------------------------------------------
# Questão 9 — Barplot: contagem por região
# --------------------------------------------------------------------

tab <- table(dados$regiao)

barplot(
  tab,
  col  = heat.colors(length(tab)),
  main = "Número de obras por região",
  xlab = "Região",
  ylab = "Frequência"
)

# Comentário:
# Sudeste concentra o maior número de obras (esperado, ~35%),
# seguido por Nordeste, Sul, Centro-Oeste e Norte.

######################################################################
# ETAPA 3 — GRÁFICOS COM GGPLOT2
######################################################################

# --------------------------------------------------------------------
# Questão 10 — Dispersão com cor por tipo de obra
# --------------------------------------------------------------------

ggplot(dados, aes(x = area_construida, y = custo_total, color = tipo_obra)) +
  geom_point(size = 2.5, alpha = 0.8) +
  labs(
    title = "Relação entre área construída e custo total",
    subtitle = "Cada cor representa um tipo de obra",
    x = "Área construída (m²)",
    y = "Custo total (R$)",
    color = "Tipo de obra"
  ) +
  theme_classic()

# Comentário:
# Ao separar por tipo, fica evidente que Infraestrutura tem reta de
# custo mais inclinada (fator 4200), seguida por Comercial (3600),
# Residencial (2800) e Industrial (2200).

# --------------------------------------------------------------------
# Questão 11 — Boxplot com preenchimento
# --------------------------------------------------------------------

ggplot(dados, aes(x = tipo_obra, y = custo_total, fill = tipo_obra)) +
  geom_boxplot(alpha = 0.85, outlier.color = "red") +
  labs(
    title = "Distribuição do custo total por tipo de obra",
    x = "Tipo de obra",
    y = "Custo total (R$)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Comentário:
# Vantagens do ggplot2: cores automáticas por categoria, possibilidade
# de ocultar legenda, temas prontos e integração com facetas.

# --------------------------------------------------------------------
# Questão 12 — Histograma com densidade
# --------------------------------------------------------------------

ggplot(dados, aes(x = resistencia_mpa)) +
  geom_histogram(aes(y = after_stat(density)),
                 bins = 25, fill = "steelblue", color = "white") +
  geom_density(color = "red", linewidth = 1) +
  labs(
    title = "Distribuição da resistência do concreto",
    x = "Resistência (MPa)",
    y = "Densidade"
  ) +
  theme_classic()

# Comentário:
# A curva de densidade confirma a leitura do histograma do Base R:
# distribuição aproximadamente normal em torno de 32 MPa.

# --------------------------------------------------------------------
# Questão 13 — Barras com agrupamento (sustentável)
# --------------------------------------------------------------------

ggplot(dados, aes(x = tipo_obra, fill = sustentavel)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Adoção de práticas sustentáveis por tipo de obra",
    x = "Tipo de obra",
    y = "Número de obras",
    fill = "Sustentável"
  ) +
  theme_minimal()

# Comentário:
# Práticas sustentáveis estão distribuídas de forma relativamente
# uniforme entre os tipos, com ligeira concentração em Residencial
# e Comercial.

# --------------------------------------------------------------------
# Questão 14 — Facetas por região
# --------------------------------------------------------------------

ggplot(dados, aes(x = area_construida, y = custo_total)) +
  geom_point(color = "darkgreen", alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  facet_wrap(~regiao, ncol = 3) +
  labs(
    title = "Área construída vs. custo total por região",
    x = "Área construída (m²)",
    y = "Custo total (R$)"
  ) +
  theme_bw()

# Comentário:
# A relação linear positiva se mantém em todas as regiões.
# Não há evidência de comportamento atípico em nenhuma região.

# --------------------------------------------------------------------
# Questão 15 — Gráfico autoral com múltiplas camadas
# --------------------------------------------------------------------

ggplot(dados, aes(x = consumo_cimento, y = resistencia_mpa, color = tipo_obra)) +
  geom_point(size = 2.5, alpha = 0.75) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 1) +
  facet_wrap(~sustentavel) +
  scale_color_brewer(palette = "Set2") +
  labs(
    title = "Consumo de cimento vs. resistência do concreto",
    subtitle = "Separado por adoção de práticas sustentáveis",
    x = "Consumo de cimento (kg/m³)",
    y = "Resistência (MPa)",
    color = "Tipo de obra"
  ) +
  theme_classic()

# Comentário:
# O gráfico combina dispersão, reta de tendência, facetas e escala
# de cores. Revela que a relação entre consumo de cimento e
# resistência é fraca (dados simulados com variáveis independentes),
# e que o padrão é semelhante entre obras sustentáveis e não
# sustentáveis. Serve para discutir a diferença entre correlação
# e causalidade.

######################################################################
# ETAPA 4 — GRÁFICOS INTERATIVOS COM PLOTLY
######################################################################

# --------------------------------------------------------------------
# Questão 16 — Convertendo ggplot em interativo
# --------------------------------------------------------------------

p <- ggplot(dados, aes(x = area_construida, y = custo_total,
                       color = tipo_obra,
                       text = paste("Obra:", id_obra,
                                    "<br>Tipo:", tipo_obra,
                                    "<br>Região:", regiao))) +
  geom_point(size = 2.5, alpha = 0.8) +
  labs(
    title = "Área × Custo (interativo)",
    x = "Área construída (m²)",
    y = "Custo total (R$)",
    color = "Tipo de obra"
  ) +
  theme_minimal()

ggplotly(p, tooltip = c("text"))

# Comentário:
# Ao passar o mouse, é possível identificar obras com custo
# atipicamente alto (provavelmente Infraestrutura no Sudeste)
# e custo atipicamente baixo (Industrial em regiões menores).

# --------------------------------------------------------------------
# Questão 17 — Gráfico interativo direto com plot_ly()
# --------------------------------------------------------------------

custo_medio_tipo <- dados |>
  group_by(tipo_obra) |>
  summarise(custo_medio = mean(custo_total))

plot_ly(
  data = custo_medio_tipo,
  x = ~tipo_obra,
  y = ~custo_medio,
  type = "scatter",
  mode = "lines+markers",
  marker = list(size = 12, color = "steelblue"),
  line = list(color = "steelblue", width = 3)
) |>
  layout(
    title = "Custo médio por tipo de obra",
    xaxis = list(title = "Tipo de obra"),
    yaxis = list(title = "Custo médio (R$)")
  )

# Comentário:
# O plot_ly() direto é mais vantajoso quando queremos controle total
# sobre o layout sem depender do ggplot, por exemplo em dashboards.

######################################################################
# ETAPA 5 — GRÁFICOS COM HIGHCHARTER
######################################################################

# --------------------------------------------------------------------
# Questão 18 — Colunas: custo médio por tipo de obra
# --------------------------------------------------------------------

dados |>
  group_by(tipo_obra) |>
  summarise(custo_medio = mean(custo_total)) |>
  hchart("column", hcaes(x = tipo_obra, y = custo_medio)) |>
  hc_title(text = "Custo médio por tipo de obra") |>
  hc_yAxis(title = list(text = "Custo médio (R$)")) |>
  hc_xAxis(title = list(text = "Tipo de obra"))

# Comentário:
# O ranking coincide com o boxplot da Questão 8:
# Infraestrutura > Comercial > Residencial > Industrial.

# --------------------------------------------------------------------
# Questão 19 — Linhas: prazo médio por região
# --------------------------------------------------------------------

dados |>
  group_by(regiao) |>
  summarise(prazo_medio = mean(prazo_meses)) |>
  hchart("line", hcaes(x = regiao, y = prazo_medio)) |>
  hc_title(text = "Prazo médio por região") |>
  hc_yAxis(title = list(text = "Meses"))

# Comentário:
# Como prazo_meses foi gerado aleatoriamente, não há diferença
# sistemática entre regiões. Esse é um bom exemplo para discutir
# a diferença entre padrão visual e significância estatística.

# --------------------------------------------------------------------
# Questão 20 — Pizza: participação por tipo de obra
# --------------------------------------------------------------------

dados |>
  count(tipo_obra) |>
  hchart("pie", hcaes(name = tipo_obra, y = n)) |>
  hc_title(text = "Participação por tipo de obra")

# Comentário:
# O gráfico de pizza é adequado para poucas categorias (4 aqui),
# mas o gráfico de barras é geralmente mais preciso para comparar
# magnitudes. Serve para discutir boas práticas de visualização.

# --------------------------------------------------------------------
# Questão 21 — Personalização
# --------------------------------------------------------------------

# Exemplo: tema escuro + tooltip + zoom + título

highchart() |>
  hc_chart(zoomType = "x") |>
  hc_title(text = "Resistência média por tipo de concreto") |>
  hc_xAxis(categories = c("C25", "C30", "C35", "C40")) |>
  hc_add_series(
    name = "Resistência média",
    data = c(25, 30, 35, 40),
    type = "column"
  ) |>
  hc_tooltip(pointFormat = "Resistência: {point.y} MPa") |>
  hc_add_theme(hc_theme_darkunica())

# Comentário:
# O tema escuro é útil para apresentações executivas.
# O zoom é útil para séries longas. O tooltip personalizado
# melhora a comunicação dos valores.

######################################################################
# ETAPA 6 — MAPAS INTERATIVOS COM LEAFLET
######################################################################

# --------------------------------------------------------------------
# Questão 22 — Mapa base
# --------------------------------------------------------------------

leaflet() |>
  addProviderTiles(providers$CartoDB.Positron) |>
  setView(lng = -44.5, lat = -19.0, zoom = 6)

# Comentário:
# O provedor CartoDB.Positron foi escolhido por ter fundo claro,
# que facilita a leitura dos marcadores sobrepostos.

# --------------------------------------------------------------------
# Questão 23 — Marcadores por região
# --------------------------------------------------------------------

obras_regiao <- data.frame(
  regiao = c("Sudeste", "Sul", "Nordeste", "Centro-Oeste", "Norte"),
  lat    = c(-19.9, -25.4, -8.0, -15.8, -3.1),
  lon    = c(-43.9, -49.3, -34.9, -47.9, -60.0),
  n      = as.integer(table(dados$regiao))
)

leaflet(obras_regiao) |>
  addTiles() |>
  addMarkers(
    lng = ~lon, lat = ~lat,
    popup = ~paste0("<b>", regiao, "</b><br>Obras: ", n)
  )

# Comentário:
# A distribuição geográfica é coerente com o barplot da Questão 9:
# Sudeste concentra o maior número de obras.

# --------------------------------------------------------------------
# Questão 24 — Destaque com círculos
# --------------------------------------------------------------------

leaflet(obras_regiao) |>
  addTiles() |>
  addMarkers(
    lng = ~lon, lat = ~lat,
    popup = ~paste0("<b>", regiao, "</b><br>Obras: ", n)
  ) |>
  addCircles(
    lng = ~lon[which.max(n)],
    lat = ~lat[which.max(n)],
    radius = 300000,
    color = "red",
    fillColor = "red",
    fillOpacity = 0.2
  )

# Comentário:
# Se tivéssemos as coordenadas exatas das obras, poderíamos mapear
# custo médio, prazo médio, índice de falhas e satisfação por região.

######################################################################
# ETAPA 7 — QUESTÕES PRÓXIMAS DA PRÁTICA PROFISSIONAL
######################################################################

# --------------------------------------------------------------------
# Questão 25 — Comparação entre tipos de obra
# --------------------------------------------------------------------

dados |>
  group_by(tipo_obra) |>
  summarise(custo_medio = mean(custo_total)) |>
  arrange(desc(custo_medio))

# Comentário:
# A afirmação "obras de infraestrutura têm custo médio superior"
# é confirmada pelos dados: Infraestrutura lidera o ranking.

ggplot(dados, aes(x = tipo_obra, y = custo_total, fill = tipo_obra)) +
  geom_boxplot() +
  labs(
    title = "Custo total por tipo de obra",
    x = "Tipo de obra",
    y = "Custo total (R$)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# --------------------------------------------------------------------
# Questão 26 — Sustentabilidade e custo
# --------------------------------------------------------------------

# Base R
boxplot(
  custo_total ~ sustentavel,
  data = dados,
  col  = c("lightgreen", "salmon"),
  main = "Custo total por adoção de práticas sustentáveis",
  xlab = "Sustentável",
  ylab = "Custo total (R$)"
)

# ggplot2
ggplot(dados, aes(x = sustentavel, y = custo_total, fill = sustentavel)) +
  geom_boxplot(alpha = 0.85) +
  labs(
    title = "Custo total por adoção de práticas sustentáveis",
    x = "Sustentável",
    y = "Custo total (R$)"
  ) +
  theme_classic() +
  theme(legend.position = "none")

# Comentário:
# Como sustentavel foi gerado independentemente do custo, não há
# diferença sistemática entre os grupos. Serve para discutir
# que ausência de padrão visual também é um resultado.

# --------------------------------------------------------------------
# Questão 27 — Relação entre falhas e satisfação
# --------------------------------------------------------------------

ggplot(dados, aes(x = indice_falhas, y = satisfacao)) +
  geom_point(alpha = 0.6, color = "darkred") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title = "Índice de falhas vs. satisfação do cliente",
    x = "Índice de falhas",
    y = "Satisfação (0–10)"
  ) +
  theme_classic()

# Comentário:
# A geometria escolhida foi geom_point() com geom_smooth() para
# investigar tendência. Como as variáveis foram geradas
# independentemente, não há associação clara. Em dados reais,
# esperaríamos correlação negativa.

# --------------------------------------------------------------------
# Questão 28 — Resumo gráfico para o engenheiro
# --------------------------------------------------------------------

# Gráfico 1: perfil das obras por tipo e região
g1 <- ggplot(dados, aes(x = regiao, fill = tipo_obra)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Perfil das obras por região e tipo",
    x = "Região",
    y = "Número de obras",
    fill = "Tipo de obra"
  ) +
  theme_minimal()

# Gráfico 2: distribuição de custo e prazo
g2 <- ggplot(dados, aes(x = custo_total, y = prazo_meses)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  labs(
    title = "Custo total vs. prazo",
    x = "Custo total (R$)",
    y = "Prazo (meses)"
  ) +
  theme_classic()

# Gráfico 3: consumo de cimento vs. resistência
g3 <- ggplot(dados, aes(x = consumo_cimento, y = resistencia_mpa)) +
  geom_point(alpha = 0.6, color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Consumo de cimento vs. resistência",
    x = "Consumo de cimento (kg/m³)",
    y = "Resistência (MPa)"
  ) +
  theme_classic()

g1
g2
g3

# Comentário:
# A ordem dos gráficos foi escolhida para ir do panorama geral
# (perfil das obras) para relações específicas (custo × prazo,
# consumo × resistência).

######################################################################
# DESAFIO FINAL — SCRIPT COMPLETO
######################################################################

# --------------------------------------------------------------------
# 1. Inspeção inicial
# --------------------------------------------------------------------

glimpse(dados)
summary(dados)

# --------------------------------------------------------------------
# 2. Um gráfico em cada sistema
# --------------------------------------------------------------------

# Base R
hist(dados$resistencia_mpa, col = "lightblue", main = "Base R")

# ggplot2
ggplot(dados, aes(x = tipo_obra, y = custo_total, fill = tipo_obra)) +
  geom_boxplot() +
  theme_classic() +
  theme(legend.position = "none")

# plotly
ggplotly(
  ggplot(dados, aes(x = area_construida, y = custo_total,
                    color = tipo_obra, text = id_obra)) +
    geom_point()
)

# highcharter
dados |>
  count(tipo_obra) |>
  hchart("column", hcaes(x = tipo_obra, y = n)) |>
  hc_title(text = "Obras por tipo")

# leaflet
leaflet(obras_regiao) |>
  addTiles() |>
  addMarkers(lng = ~lon, lat = ~lat, popup = ~regiao)

# --------------------------------------------------------------------
# 3. Gráfico autoral com múltiplas camadas e facetas
# --------------------------------------------------------------------

ggplot(dados, aes(x = area_construida, y = custo_total, color = tipo_obra)) +
  geom_point(size = 2.5, alpha = 0.75) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~regiao, ncol = 3) +
  scale_color_brewer(palette = "Set2") +
  labs(
    title = "Área × custo por região e tipo de obra",
    x = "Área construída (m²)",
    y = "Custo total (R$)",
    color = "Tipo de obra"
  ) +
  theme_classic()

# --------------------------------------------------------------------
# 4. Mapa interativo com marcadores e popups
# --------------------------------------------------------------------

leaflet(obras_regiao) |>
  addProviderTiles(providers$CartoDB.Positron) |>
  setView(lng = -44.5, lat = -19.0, zoom = 5) |>
  addMarkers(
    lng = ~lon, lat = ~lat,
    popup = ~paste0("<b>", regiao, "</b><br>Obras: ", n)
  )

# --------------------------------------------------------------------
# 5. Interpretações técnicas
# --------------------------------------------------------------------

# (Devem ser escritas pelos alunos no relatório, uma para cada gráfico.)

# --------------------------------------------------------------------
# 6. Justificativas das decisões visuais
# --------------------------------------------------------------------

# (Devem ser escritas pelos alunos no relatório.)

######################################################################
# REFLEXÃO FINAL — RESPOSTAS ESPERADAS
######################################################################

# 1. Principal diferença entre Base R e ggplot2:
#    - Base R: funções gráficas nativas, cada gráfico é uma chamada
#      isolada, pouco flexível para camadas.
#    - ggplot2: gramática de gráficos, construção por camadas,
#      mapeamentos estéticos, facetas e temas.

# 2. Por que a escolha do sistema e da geometria é uma decisão
#    técnica importante:
#    - Cada geometria comunica uma informação diferente.
#    - Boxplot para comparar grupos; dispersão para relação entre
#      variáveis; histograma para distribuição; barras para contagens.
#    - Escolher mal pode induzir a interpretações equivocadas.

# 3. Gráfico mais informativo, sistema utilizado, justificativa
#    e conclusão sobre as obras:
#    - (Resposta pessoal do aluno.)

######################################################################
# FIM DO GABARITO
######################################################################