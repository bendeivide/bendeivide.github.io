# ============================================================================
# GERANDO UM DATA.FRAME COM 5 VARIÁVEIS E 1000 OBSERVAÇÕES
# Contexto: Alunos de uma escola pública
# Objetivo: Estudo de coleta, organização, tabulação e apresentação gráfica
# Disciplina: Mestrado Profmat - Estatística Aplicada
# ============================================================================

# Definir semente para reprodutibilidade
set.seed(2026)

faltas <- rpois(n = 1000, lambda = 8)  # Distribuição de Poisson
nota_media <- round(rnorm(n = 1000, mean = 6.5, sd = 2.0), 1) # Ajustar para o intervalo [0, 10]

# Criar o data.frame com 1000 observações
dados_alunos <- data.frame(
  
  # -------------------------------------------------------------------------
  # Variável 1: QUANTITATIVA DISCRETA
  # Número de faltas do aluno no ano letivo (0 a 30 faltas)
  # -------------------------------------------------------------------------
  # Ajustar para valores entre 0 e 30
  faltas = ifelse(faltas > 30, 30, faltas),
  
  # -------------------------------------------------------------------------
  # Variável 2: QUANTITATIVA CONTÍNUA
  # Nota média do aluno (0 a 10, com uma casa decimal)
  # -------------------------------------------------------------------------
  nota_media = pmax(0, pmin(10, nota_media)),
  
  # -------------------------------------------------------------------------
  # Variável 3: QUALITATIVA NOMINAL (sem ordem)
  # Turno que o aluno estuda
  # -------------------------------------------------------------------------
  turno = sample(
    x = c("Matutino", "Vespertino", "Noturno"),
    size = 1000,
    replace = TRUE,
    prob = c(0.45, 0.35, 0.20)  # Probabilidades para cada turno
  ),
  
  # -------------------------------------------------------------------------
  # Variável 4: QUALITATIVA ORDINAL (com ordem)
  # Nível de escolaridade da mãe (ordem: Fundamental < Médio < Superior)
  # -------------------------------------------------------------------------
  escolaridade_mae = factor(
    x = sample(
      x = c("Fundamental", "Médio", "Superior"),
      size = 1000,
      replace = TRUE,
      prob = c(0.40, 0.45, 0.15)
    ),
    levels = c("Fundamental", "Médio", "Superior"),  # Define a ordem
    ordered = TRUE
  ),
  
  # -------------------------------------------------------------------------
  # Variável 5: QUALITATIVA NOMINAL (sem ordem)
  # Possui acesso à internet em casa?
  # -------------------------------------------------------------------------
  acesso_internet = sample(
    x = c("Sim", "Não"),
    size = 1000,
    replace = TRUE,
    prob = c(0.70, 0.30)
  )
)

# Exportar para CSV
write.csv2(dados_alunos, file = "/home/ben10/Documentos/TRABALHO_TEMPORARIO/bendeivide.github.io(31.08.2026)/static/profmat/2026.2/relatorios/rel02/dados_alunos.csv", row.names = FALSE)
