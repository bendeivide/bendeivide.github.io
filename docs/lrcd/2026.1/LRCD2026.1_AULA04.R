######################################################################
# AULA 04 - MANIPULANDO OBJETOS
# DISCIPLINA: LRCD
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/rcd
######################################################################

############################################################
# Aula: Manipulação de objetos em R (Base R)
############################################################

## -------------------------------
## 1. Vetores
## -------------------------------

# Criando vetores
notas <- c(7.5, 8.0, 6.5, 9.0, 5.5); notas
alunos <- c("Ana", "Bruno", "Carlos", "Daniela", "Eduardo")

# Nomeando elementos
names(notas) <- alunos; notas

# Operações vetoriais
media <- mean(notas); media

# Indexação
notas[1]           # primeiro elemento
notas["Ana"]       # por nome

# Indexação lógica
aprovados <- notas >= 7
aprovados
# Quem foi aprovado?
notas[aprovados]
# Quem foi reprovado?
notas[!aprovados]

## -------------------------------
## 2. Data Frame
## -------------------------------

dados <- data.frame(
  aluno = alunos,
  matematica = c(7.5, 8.0, 6.5, 9.0, 5.5),
  estatistica = c(8.0, 7.5, 6.0, 9.5, 6.0),
  programacao = c(7.0, 8.5, 7.0, 9.0, 5.0)
)

# Visualização
dados
str(dados)
summary(dados)

# Acessando colunas
dados$matematica
dados[, "estatistica"]
dados[, 2]

## -------------------------------
## 3. Subconjuntos
## -------------------------------

# Alunos com nota >= 7 em matemática
subset(dados, matematica >= 7)

# Selecionando colunas específicas
subset(dados, select = c(aluno, programacao))

# Condição múltipla
subset(dados, matematica >= 7 & estatistica >= 7)

## -------------------------------
## 4. apply()
## -------------------------------

# Média por linha (por aluno)
apply(dados[, 2:4], 1, mean)

# Média por coluna (por disciplina)
apply(dados[, 2:4], 2, mean)

## -------------------------------
## 5. lapply() e sapply()
## -------------------------------

# Lista com colunas numéricas
lista_notas <- dados[, 2:4]

# lapply: retorna lista
lapply(lista_notas, mean)

# sapply: simplifica resultado
sapply(lista_notas, mean)

## -------------------------------
## 6. Criando nova variável
## -------------------------------

# Média geral por aluno
dados$media <- apply(dados[, 2:4], 1, mean)

# Situação do aluno
dados$situacao <- ifelse(dados$media >= 7, "Aprovado", "Reprovado")

dados

## -------------------------------
## 7. Problema aplicado
## -------------------------------

# Perguntas:

# 1. Qual disciplina tem maior média?
medias <- sapply(dados[, 2:4], mean)
medias
# Qual?
names(which.max(medias))

# 2. Quantos alunos foram aprovados?
sum(dados$situacao == "Aprovado")

# 3. Quais alunos têm média acima da média geral?
media_geral <- mean(dados$media)

subset(dados, media > media_geral)


## -------------------------------
## 8. Controle de fluxo
## -------------------------------

## Reutilizando o data frame anterior
dados

## -------------------------------
## 8.1 Estrutura if
## -------------------------------

# Verificar situação de um aluno específico
nota_media_ana <- dados$media[1]

if (nota_media_ana >= 7) {
  print("Ana está aprovada")
} else {
  print("Ana está reprovada")
}

## -------------------------------
## 8.2 Usando if dentro de loop
## -------------------------------

# Classificando alunos manualmente (sem ifelse)
situacao_manual <- character(nrow(dados))

for (i in 1:nrow(dados)) {
  if (dados$media[i] >= 7) {
    situacao_manual[i] <- "Aprovado"
  } else {
    situacao_manual[i] <- "Reprovado"
  }
}

situacao_manual

## Comparando com resultado vetorizado
dados$situacao
situacao_manual

## -------------------------------
## 8.3 Estrutura for
## -------------------------------

# Calculando média manualmente (sem apply)
media_manual <- numeric(nrow(dados))

for (i in 1:nrow(dados)) {
  soma <- 0
  
  for (j in 2:4) {
    soma <- soma + dados[i, j]
  }
  
  media_manual[i] <- soma / 3
}

media_manual
dados$media

## -------------------------------
## 8.4 Estrutura while
## -------------------------------

# Simulando crescimento da média até atingir um valor alvo
media_simulada <- 5
incremento <- 0.3
iteracoes <- 0

while (media_simulada < 7) {
  media_simulada <- media_simulada + incremento
  iteracoes <- iteracoes + 1
}

media_simulada
iteracoes

## -------------------------------
## 8.5 Exemplo aplicado com for + if
## -------------------------------

# Encontrar alunos com média acima da média geral
media_geral <- mean(dados$media)

alunos_acima_media <- c()

for (i in 1:nrow(dados)) {
  if (dados$media[i] > media_geral) {
    alunos_acima_media <- c(alunos_acima_media, dados$aluno[i])
  }
}

alunos_acima_media

## -------------------------------
## 8.6 Comparação: for vs apply
## -------------------------------

# Usando for
medias_for <- numeric(ncol(dados[,2:4]))

for (i in 1:ncol(dados[,2:4])) {
  medias_for[i] <- mean(dados[,2:4][, i])
}

medias_for

# Usando apply
medias_apply <- apply(dados[,2:4], 2, mean); medias_apply

# Usando sapply
medias_sapply <- sapply(dados[,2:4], mean); medias_sapply

## -------------------------------
## 9. Base de dados: pacote datasets
## -------------------------------

# library(datasets)
dados <- penguins; dados
## Os dados foram coletados no arquipélago Palmer, 
## na Antártica, por meio do projeto ecológico conduzido 
## pela Palmer Station LTER (Long Term Ecological Research).
##
##   Número de observações: 344 pinguins
##   Número de variáveis: 8
##   Tipo: data frame
##   Cada linha representa um pinguim observado.
##
## 🧾 Variáveis da base

### 🔹 Variáveis categóricas (qualitativas)
# - **`species`**  
#   Espécie do pinguim:
#   - Adelie  
#   - Chinstrap  
#   - Gentoo
# - **`island`**  
#   Ilha onde o pinguim foi observado:
#   - Biscoe  
#   - Dream  
#   - Torgersen  
# - **`sex`**  
#   Sexo do pinguim:
#   - male  
#   - female  
# *(com valores ausentes em alguns casos)*
### 🔹 Variáveis numéricas (quantitativas)
# - **`bill_length_mm`**  
#   Comprimento do bico (mm)
# - **`bill_depth_mm`**  
#   Profundidade do bico (mm)
# - **`flipper_length_mm`**  
#   Comprimento da nadadeira (mm)
# - **`body_mass_g`**  
#   Massa corporal (gramas)
# ### 🔹 Variável adicional
# - **`year`**  
#   Ano da observação (2007, 2008 ou 2009)
## ⚠️ Valores ausentes
# A base contém alguns valores faltantes (`NA`), especialmente em:
#   - `sex`
#   - medições físicas


# Visualização inicial
head(dados) # Visuali
str(dados)
summary(dados)

## -------------------------------
## 9.1 Limpeza de dados
## -------------------------------

# Remover linhas com NA
dados_limpos <- na.omit(dados)

nrow(dados)
nrow(dados_limpos)

## -------------------------------
## 9.2 Subconjuntos
## -------------------------------

# Apenas pinguins da espécie Adelie
adelie <- subset(dados_limpos, species == "Adelie")

# Apenas ilha Biscoe
biscoe <- subset(dados_limpos, island == "Biscoe")

## -------------------------------
## 9.3 Estatísticas por grupo
## -------------------------------

# Média do comprimento do bico por espécie
tapply(dados_limpos$bill_len,
       dados_limpos$species,
       mean)

# Massa média por sexo
tapply(dados_limpos$body_mass,
       dados_limpos$sex,
       mean)

## -------------------------------
## 9.4 Usando aggregate()
## -------------------------------

# Média de múltiplas variáveis por espécie
aggregate(cbind(bill_len, flipper_len, body_mass) ~ species,
          data = dados_limpos,
          FUN = mean)

# Média por espécie e sexo
aggregate(body_mass ~ species + sex,
          data = dados_limpos,
          FUN = mean)

## -------------------------------
## 9.5 Usando split() + lapply()
## -------------------------------

# Dividindo por espécie
dados_split <- split(dados_limpos, dados_limpos$species)

# Média da massa em cada grupo
lapply(dados_split, function(df) mean(df$body_mass))

# Número de observações por grupo
sapply(dados_split, nrow)

## -------------------------------
## 9.6 Criando variáveis derivadas
## -------------------------------

# Índice simples (relação bico/comprimento nadadeira)
dados_limpos$indice <- dados_limpos$bill_len / dados_limpos$flipper_len
head(dados_limpos) # primeiros dados
# Classificação com ifelse
dados_limpos$tamanho <- ifelse(dados_limpos$body_mass > 4000,
                               "Grande",
                               "Pequeno")
head(dados_limpos) # primeiros dados
table(dados_limpos$tamanho)

## -------------------------------
## 9.7 Aplicação com apply
## -------------------------------

# Média das variáveis numéricas por linha
dados_limpos$media_medidas <- apply(dados_limpos[, c("bill_len",
                                                     "bill_dep",
                                                     "flipper_len",
                                                     "body_mass")],
                                    1,
                                    mean)
head(dados_limpos)
## -------------------------------
## 9.8 Controle de fluxo (for + if)
## -------------------------------

# Identificar pinguins com massa acima da média da espécie

dados_limpos$acima_media <- FALSE

for (i in 1:nrow(dados_limpos)) {
  
  especie <- dados_limpos$species[i]
  
  media_especie <- mean(dados_limpos$body_mass[dados_limpos$species == especie])
  
  if (dados_limpos$body_mass[i] > media_especie) {
    dados_limpos$acima_media[i] <- TRUE
  }
}

table(dados_limpos$acima_media)

## -------------------------------
## 9.9 Problema aplicado
## -------------------------------

# Qual espécie tem maior massa média?
medias_especie <- tapply(dados_limpos$body_mass,
                         dados_limpos$species,
                         mean)

medias_especie
names(which.max(medias_especie))

# Qual combinação espécie + sexo tem maior média?
medias_grupo <- aggregate(body_mass ~ species + sex,
                          data = dados_limpos,
                          mean)

medias_grupo

medias_grupo[which.max(medias_grupo$body_mass), ]


## -------------------------------
## 10. Funções adicionais (base R)
## -------------------------------

## Reutilizando dados_limpos (penguins)

head(dados_limpos)

## -------------------------------
## 10.1 with()
## -------------------------------

# Evita repetição do nome do data frame
with(dados_limpos, mean(body_mass))

# Comparação por espécie
with(dados_limpos,
     tapply(body_mass_g, species, mean))

## -------------------------------
## 10.2 by()
## -------------------------------

# Aplicar função por grupo
by(dados_limpos$body_mass_g,
   dados_limpos$species,
   mean)

# Mais complexo: média de múltiplas variáveis por espécie
by(dados_limpos[, c("bill_length_mm", "flipper_length_mm")],
   dados_limpos$species,
   colMeans)

## -------------------------------
## 10.3 within()
## -------------------------------

# Criando novas variáveis de forma organizada
dados2 <- within(dados_limpos, {
  
  media_medidas2 <- (bill_length_mm + bill_depth_mm +
                       flipper_length_mm + body_mass_g) / 4
  
  categoria_massa <- ifelse(body_mass_g > 4000,
                            "Grande",
                            "Pequeno")
})

head(dados2)

## -------------------------------
## 10.4 ave()
## -------------------------------

# Média da massa por grupo (mesmo tamanho do vetor original)
dados_limpos$media_por_especie <- ave(dados_limpos$body_mass_g,
                                      dados_limpos$species,
                                      FUN = mean)

head(dados_limpos[, c("species", "body_mass_g", "media_por_especie")])

## Comparando indivíduo com sua média
dados_limpos$acima_media2 <- dados_limpos$body_mass_g >
  dados_limpos$media_por_especie

table(dados_limpos$acima_media2)

## -------------------------------
## 10.5 Comparação entre abordagens
## -------------------------------

# tapply
tapply(dados_limpos$body_mass_g,
       dados_limpos$species,
       mean)

# by
by(dados_limpos$body_mass_g,
   dados_limpos$species,
   mean)

# aggregate
aggregate(body_mass_g ~ species,
          data = dados_limpos,
          mean)

## -------------------------------
## 10.6 Problema aplicado
## -------------------------------

# Identificar indivíduos com massa acima da média da espécie
# usando ave (forma mais elegante)

dados_limpos$acima_media3 <-
  with(dados_limpos,
       body_mass_g > ave(body_mass_g, species, FUN = mean))

table(dados_limpos$acima_media3)



