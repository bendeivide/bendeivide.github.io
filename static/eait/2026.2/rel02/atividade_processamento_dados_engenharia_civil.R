################################################################
# LISTA DE RELATORIO 02
# DISCIPLINA: EAIT
# MESTRADO PROFISSIONAL EM TECNOLOGIAS E INOVACOES CONSTRUTIVAS
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/eait
################################################################

# 1. Importação ------------------------------------------------
dados <- read.csv2("base_processamento_dados_engenharia_civil.csv",
                   stringsAsFactors = FALSE,
                   check.names = FALSE)

# Explore a estrutura, os nomes e um resumo inicial.
str(dados)
summary(dados)

# 2. Diagnóstico e limpeza ------------------------------------
# Investigue valores ausentes, tipos de variáveis, categorias
# inconsistentes e valores potencialmente incompatíveis.

# 3. Responda às questões da atividade usando, prioritariamente,
# Base R e as funções estudadas em aula:
# subset(), apply(), lapply(), sapply(), ifelse(), for, if,
# tapply(), aggregate(), split(), with(), by(), within() e ave().

# Não altere a base original. Crie objetos derivados para as
# etapas de limpeza e análise.

# 4. Ao final, apresente uma versão limpa da base e registre
# quais problemas foram encontrados e quais decisões foram tomadas.
