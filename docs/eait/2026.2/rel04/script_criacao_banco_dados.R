# ============================================================
# GERAÇÃO DO BANCO DE DADOS — ENGENHARIA CIVIL
# Disciplina: Estatística Aplicada a Inovações Tecnológicas
# ============================================================

set.seed(2026)

n <- 300

dados_eng <- data.frame(
  id_obra          = 1:n,
  tipo_obra        = sample(c("Residencial", "Comercial", "Industrial", "Infraestrutura"),
                            n, replace = TRUE,
                            prob = c(0.40, 0.25, 0.20, 0.15)),
  regiao           = sample(c("Sudeste", "Sul", "Nordeste", "Centro-Oeste", "Norte"),
                            n, replace = TRUE,
                            prob = c(0.35, 0.20, 0.25, 0.12, 0.08)),
  area_construida  = round(rnorm(n, mean = 850, sd = 320), 1),
  custo_total      = NA,
  prazo_meses      = sample(6:36, n, replace = TRUE),
  resistencia_mpa  = round(rnorm(n, mean = 32, sd = 4.5), 2),
  consumo_cimento  = round(rnorm(n, mean = 340, sd = 45), 1),
  indice_falhas    = round(rpois(n, lambda = 2.3), 0),
  satisfacao       = round(runif(n, 1, 10), 1),
  sustentavel      = sample(c("Sim", "Não"), n, replace = TRUE, prob = c(0.45, 0.55))
)

# Custo total com base na área, tipo de obra e ruído
fator_tipo <- c("Residencial" = 2800, "Comercial" = 3600,
                "Industrial" = 2200, "Infraestrutura" = 4200)

dados_eng$custo_total <- round(
  dados_eng$area_construida *
    fator_tipo[dados_eng$tipo_obra] *
    rnorm(n, mean = 1, sd = 0.12),
  2
)

# Arredondamentos coerentes
dados_eng$area_construida <- abs(dados_eng$area_construida)
dados_eng$resistencia_mpa <- abs(dados_eng$resistencia_mpa)
dados_eng$consumo_cimento <- abs(dados_eng$consumo_cimento)

# Visualização inicial
head(dados_eng)
str(dados_eng)
summary(dados_eng)

# Salvando o CSV para os alunos
write.csv(dados_eng, "dados_engenharia_civil.csv", row.names = FALSE)
