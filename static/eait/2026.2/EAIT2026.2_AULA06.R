######################################################################
# AULA 06 - PROCESSAMENTO DE DADOS (PARTE II - FAMÍLIA TIDYVERSE)
# DISCIPLINA: EAIT
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/eait
######################################################################

# Instalacao e carregamento dos pacotes
# install.packages("tidyverse")
library(tidyverse)  # Carrega todos os pacotes do tidyverse (dplyr, ggplot2, tidyr, etc.)

# Criando um dataset de exemplo
set.seed(123)  # Define semente aleatoria para resultados reprodutíveis
vendas <- tibble(  # tibble: versao moderna do data.frame com melhor impressao e comportamento
  id = 1:100,
  data = sample(seq(as.Date('2024-01-01'), as.Date('2024-12-31'), by="day"), 100),
  produto = sample(c("Notebook", "Mouse", "Teclado", "Monitor", "Webcam"), 100, replace = TRUE),
  categoria = sample(c("Eletrônicos", "Acessórios", "Periféricos"), 100, replace = TRUE),
  quantidade = sample(1:10, 100, replace = TRUE),
  preco_unitario = round(runif(100, 50, 2000), 2),
  cliente_estado = sample(c("SP", "RJ", "MG", "RS", "BA", "PR", "SC"), 100, replace = TRUE)
)
# Visualizar
View(vendas)

# Adicionando coluna de valor total
vendas$valor_total <- vendas$quantidade * vendas$preco_unitario

# Visualizando os dados
cat("\nDataset de Vendas:")
vendas
cat("Estrutura dos dados:")
glimpse(vendas)  # glimpse(): similar ao str() mas mais amigavel, mostra tipo e primeiros valores

# ===============================================
# 1. FILTER - Filtrar linhas baseado em condicoes
# ===============================================

print("=== FILTER ===")
# filter(): seleciona linhas que atendem a condicoes booleanas

# Filtrar vendas com valor total > 5000
vendas_caras <- vendas |> 
  filter(valor_total > 5000)  # Mantem apenas linhas onde valor_total eh maior que 5000
print(paste("Vendas caras (> R$5000):", nrow(vendas_caras), "registros"))
View(vendas_caras)
## Imprimindo todas as colunas
vendas |>
  filter(valor_total > 5000) |>
  print(width = Inf)
  

# Multiplas condicoes (AND - todas devem ser verdadeiras)
vendas_sp_monitor <- vendas |> 
  filter(categoria == "Eletrônicos" & cliente_estado == "SP")  # & significa "E" (ambas condicoes)
print(paste("Vendas de Eletrônicos em SP:", nrow(vendas_sp_monitor), "registros"))
View(vendas_sp_monitor)

# Multiplas condicoes (OR - pelo menos uma verdadeira)
vendas_grandes <- vendas |> 
  filter(quantidade >= 8 | valor_total > 3000 )  # | significa "OU" (pelo menos uma condicao)
print(paste("Vendas grandes (quant>=8 ou valor>3000):", nrow(vendas_grandes), "registros"))
vendas_grandes
# ============================================
# 2. SELECT - Selecionar colunas
# ============================================

print("=== SELECT ===")
# select(): escolhe colunas especificas para manter ou remover

# Selecionar colunas específicas
vendas_resumido <- vendas |> 
  select(id, data, produto, quantidade, valor_total)  # Mantem apenas estas colunas
print("Dataset resumido:")
print(head(vendas_resumido))
View(vendas_resumido)

# Selecionar colunas que começam com determinado prefixo
vendas_preco <- vendas |> 
  select(starts_with("preco"))  # starts_with(): helper para selecionar colunas com prefixo específico
print("Colunas que começam com 'preco':")
print(head(vendas_preco))
View(vendas_preco)


# Selecionar colunas que terminam com determinado sufixo
vendas_estado <- vendas |> 
  select(ends_with("estado"))  # ends_with(): helper para selecionar colunas com sufixo específico
print("Colunas que terminam com 'estado':")
print(head(vendas_estado))
View(vendas_estado)

# Selecionar colunas que contem determinado termo
vendas_und <- vendas |> 
  select(contains("_"))  # contains(): helper para selecionar colunas que contem determinado termo
print("Colunas que contem '_':")
print(head(vendas_und))
View(vendas_und)

# Selecionar colunas que contem determinada expressao especifica
## Por exemplo, desejamos uma coluna que contenha o simbolo "_"
##  seguida das letras "u", "e" ou "t", fazemos isso: matches("_[uet]")
## a funcao contains() entende "_[uet]" como caracteres literalmente
vendas_unt <- vendas |> 
  select(matches("_[uet]"))  # Variaveis que contem "_" seguidas de "u", "e" ou "t"
print("Colunas que contem '_' seguido com 'u', 'e' ou 't':")
print(head(vendas_unt))
View(vendas_unt)

# ============================================================
# EXPRESSÕES REGULARES (REGEX) - EXEMPLOS PRÁTICOS
# ============================================================

# ------------------------------------------
# 1. Classes de caracteres
# ------------------------------------------

# [pt]al  -> "p" ou "t" seguido de "al"
# Exemplos: "pal", "tal"
texto1 <- c("pal", "tal", "sal", "mal")
grep("[pt]al", texto1, value = TRUE)  # Retorna "pal" "tal"

# ------------------------------------------
# 2. Quantificadores - caracteres
# ------------------------------------------

# \\d{3}  -> pelo menos 3 caracteres consecutivos
# Exemplos: "123", "456", "789"
texto2 <- c("123", "456a", "789", "12", "1234")
grep("\\d{3}", texto2, value = TRUE)  # Retorna "123"  "456a" "789"  "1234"

# ------------------------------------------
# 3. Classes de caracteres - letras maiúsculas
# ------------------------------------------

# [A-Z]  -> Qualquer letra maiúscula
# Exemplos: "A", "B", "C"
texto3 <- c("A", "b", "C", "d", "E")
grep("[A-Z]", texto3, value = TRUE)  # Retorna "A" "C" "E"

# ------------------------------------------
# 4. Âncoras - final da string
# ------------------------------------------

# @mail\\.com$  -> Termina com "@mail.com"
# Exemplo: "joao@gmail.com"
texto4 <- c("joao@gmail.com", "maria@mail.com", "pedro@yahoo.com")
grep("@mail\\.com$", texto4, value = TRUE)  # Retorna "maria@mail.com"

# ------------------------------------------
# 5. Padrões específicos - CEP brasileiro
# ------------------------------------------

# \\d{5}-\\d{3}  -> CEP brasileiro (5 dígitos - 3 dígitos)
# Exemplo: "12345-678"
texto5 <- c("12345-678", "1234-567", "123456-78", "12345-67")
grep("\\d{5}-\\d{3}", texto5, value = TRUE)  # Retorna "12345-678"

# ------------------------------------------
# 6. Âncoras e quantificadores - apenas números
# ------------------------------------------

# ^[0-9]+$  -> Apenas números (do início ao fim)
# Exemplos: "123", "4567"
texto6 <- c("123", "4567", "12a3", " 123", "123 ")
grep("^[0-9]+$", texto6, value = TRUE)  # Retorna "123" "4567"

# ============================================================
# APLICAÇÃO NO DATASET IRIS 
# ============================================================

# Seleciona colunas que contêm "pal" ou "tal"
iris %>% select(matches("[pt]al")) |> head()

# Explicação: 
# - "Sepal" contém "pal" -> selecionado
# - "Petal" contém "tal" -> selecionado
# - "Species" não contém nenhum -> NÃO selecionado

# ============================================================
# FUNÇÕES ÚTEIS PARA REGEX NO R
# ============================================================

# grep()       - Encontra padrões em vetores
# grepl()      - Retorna TRUE/FALSE para cada elemento
# regexpr()    - Encontra a posição do padrão
# gsub()       - Substitui padrões
# strsplit()   - Divide strings usando regex
# stringr::str_detect() - Alternativa moderna (tidyverse)

# Exemplo com grepl (retorna lógico):
grepl("[pt]al", c("pal", "tal", "sal"))  # TRUE TRUE FALSE

# Exemplo com gsub (substituição):
gsub("[pt]al", "XX", c("palavra", "metal", "sal"))  
# Retorna: "XXavra" "meXX" "sal"

# Remover colunas específicas (uso do sinal de menos)
vendas_sem_id <- vendas |> 
  select(-id, -categoria)  # - significa "remover estas colunas"
print("Dataset sem colunas id e categoria:")
print(head(vendas_sem_id))

# ============================================
# 3. MUTATE - Criar/Modificar colunas
# ============================================

print("=== MUTATE ===")
# mutate(): adiciona novas colunas ou modifica colunas existentes

# Criar novas colunas
vendas_com_imposto <- vendas |> 
  mutate(
    imposto = valor_total * 0.18,  # Cria nova coluna com 18% de imposto
    valor_com_imposto = valor_total + imposto,  # Pode usar colunas recém-criadas
    desconto = ifelse(valor_total > 3000, valor_total * 0.1, 0),  # ifelse(): condicional
    valor_final = valor_com_imposto - desconto  # Combinação de operações
  )
# Visualizando
View(vendas_com_imposto)
dim(vendas_com_imposto)

cat("Novas colunas criadas (imposto, desconto, etc):")
vendas_com_imposto |>
  print(
        n = 7, # quantas linhas impressas
    width = Inf  # todas as colunas impressas
  )
# Selecionando algumas colunas
vendas_com_imposto |> 
  select(valor_total, imposto, desconto, valor_final)

# Transformar dados
vendas_transformado <- vendas |> 
  mutate(
    mes = month(data),  # month(): extrai mês da data (do pacote lubridate, parte do tidyverse)
    ano = year(data),   # year(): extrai ano da data
    semana = week(data),  # week(): extrai número da semana
    produto_maiusculo = toupper(produto),  # toupper(): converte para maiúsculas
    preco_arredondado = round(preco_unitario, 0)  # round(): arredondamento numérico
  )
cat("Colunas transformadas:")
vendas_transformado |> 
  select(data, mes, produto_maiusculo, preco_arredondado)

# ============================================
# 4. GROUP_BY + SUMMARISE - Agrupamento e Resumo
# ============================================

cat("=== GROUP_BY + SUMMARISE ===")
# group_by(): define grupos para operações agregadas
# summarise(): reduz múltiplos valores a um resumo por grupo

# Total de vendas por produto
vendas_por_produto <- vendas |> 
  group_by(produto) |>  # Agrupa dados por produto (Notebook, Mouse, etc.)
  summarise(  # Calcula estatísticas para cada grupo
    total_vendas = n(),  # n(): conta número de linhas no grupo
    receita_total = sum(valor_total),  # sum(): soma todos os valores do grupo
    media_preco = mean(preco_unitario),  # mean(): calcula média aritmética
    quantidade_total = sum(quantidade),
    receita_media = mean(valor_total)
  ) |> 
  arrange(desc(receita_media))  # arrange(): ordena resultados
cat("Resumo por produto:")
vendas_por_produto

# Análise por estado e categoria (agrupamento múltiplo)
vendas_por_estado_cat <- vendas |> 
  group_by(cliente_estado, categoria) |>  # Agrupa por duas variáveis
  summarise(
    total_vendas = n(),
    receita = sum(valor_total),
    media_valor = mean(valor_total),
    .groups = "drop"  # Remove agrupamento após summarise
  ) |> 
  arrange(cliente_estado, desc(receita))
cat("Resumo por estado e categoria (top 20):")
vendas_por_estado_cat

# Métricas avançadas com summarise
metricas_avancadas <- vendas |> 
  group_by(produto) |> 
  summarise(
    n_vendas = n(),
    receita_total = sum(valor_total),
    receita_media = mean(valor_total),
    receita_mediana = median(valor_total),  # median(): valor do meio
    quantidade_total = sum(quantidade),
    quantidade_media = mean(quantidade),
    desvio_padrao = sd(valor_total),  # sd(): desvio padrão
    min_valor = min(valor_total),  # min(): valor mínimo
    max_valor = max(valor_total),  # max(): valor máximo
    amplitude = max_valor - min_valor,
    cv = (desvio_padrao / receita_media) * 100  # Coeficiente de variação
  )
cat("Métricas avançadas por produto:")
metricas_avancadas |>
  print(width = Inf)

# ============================================
# 5. ARRANGE - Ordenação de linhas
# ============================================

print("\n=== ARRANGE ===")
# arrange(): ordena as linhas do data frame baseado em colunas

# Ordenar por valor total (decrescente)
vendas_ordenadas <- vendas |> 
  arrange(desc(valor_total))  # desc(): ordena em ordem decrescente (crescente é padrão)
print("Top 10 maiores vendas:")
print(head(vendas_ordenadas, 10))

# Ordenação múltipla (primeiro por estado, depois por valor)
vendas_mult_ordem <- vendas |> 
  arrange(cliente_estado, desc(valor_total))  # Ordena primeiro por estado, dentro do estado por valor
print("Ordenado por estado e depois valor (decrescente):")
print(head(vendas_mult_ordem, 10))

# ============================================
# 6. PIPING (%>%) - Encadeamento de operações
# ============================================

print("\n=== PIPING ===")
# |> (pipe): passa o resultado da esquerda como primeiro argumento da função da direita
# Permite encadear múltiplas operações sem criar variáveis intermediárias

# Exemplo de pipeline completo
analise_completa <- vendas |>  # Começa com dados originais
  filter(categoria == "Eletrônicos") |>  # Filtra eletrônicos
  mutate(faixa_valor = case_when(  # case_when(): condicional múltipla (similar a ifelse aninhado)
    valor_total < 1000 ~ "Baixo",  # Quando condição verdadeira, atribui valor
    valor_total < 3000 ~ "Médio",
    TRUE ~ "Alto"  # TRUE é o caso padrão (else)
  )) |>
  group_by(produto, faixa_valor) |>  # Agrupa por duas colunas
  summarise(
    total_vendas = n(),
    receita = sum(valor_total),
    .groups = "drop"
  ) |>
  arrange(produto, desc(receita))  # Ordena resultado final

print("Análise pipeline completa:")
print(analise_completa)

# ============================================
# 6.1 PIPE NATIVO (|>) vs PIPE MAGRITTR (%>%)
# ============================================

print("\n=== PIPE NATIVO |> vs %|>% ===")
# A partir do R 4.1+, o R possui um pipe nativo: |>
# Na maioria dos casos, os dois se comportam de forma idêntica:

# Com %|>% (magrittr, carregado com o tidyverse):
vendas %|>%
  filter(produto == "Notebook") %|>%
  summarise(media = mean(valor_total))

# Com |> (nativo do R, sem dependência de pacote):
vendas |>
  filter(produto == "Notebook") |>
  summarise(media = mean(valor_total))

# Diferenças principais:
# |>  -> nativo do R 4.1+, sem precisar de pacote, levemente mais rápido
# %|>% -> do magrittr/dplyr, suporta "." como placeholder em qualquer posição
# Recomendação atual: prefira |> em projetos novos

# Exemplo de uso do placeholder com %|>% (posição não-padrão):
# vendas %|>% lm(valor_total ~ quantidade, data = .)
# Com |> isso requer sintaxe diferente (R 4.2+):
# vendas |> lm(valor_total ~ quantidade, data = _)

# ============================================
# 7. FUNÇÕES ADICIONAIS ÚTEIS
# ============================================

print("\n=== FUNÇÕES ADICIONAIS ===")

# RENAME - Renomear colunas
vendas_renomeado <- vendas |> 
  rename(  # rename(): altera nomes de colunas
    estado = cliente_estado,  # Novo nome = nome antigo
    produto_nome = produto,
    valor = valor_total
  )
print("Colunas renomeadas:")
print(names(vendas_renomeado))

# DISTINCT - Valores únicos
produtos_unicos <- vendas |> 
  distinct(produto)  # distinct(): retorna linhas únicas baseado nas colunas especificadas
print("Produtos únicos:")
print(produtos_unicos)

# COUNT - Contagem rápida (combina group_by + summarise)
contagem_produtos <- vendas |> 
  count(produto, sort = TRUE)  # count(): atalho para group_by + summarise(n = n()), sort ordena
print("Contagem por produto:")
print(contagem_produtos)

# SLICE - Selecionar linhas por posição
top5_vendas <- vendas |> 
  arrange(desc(valor_total)) |> 
  slice(1:5)  # slice(): seleciona linhas por posição numérica (similar ao [1:5,])
print("Top 5 vendas:")
print(top5_vendas)

# PULL - Extrair coluna como vetor
valores_venda <- vendas |> 
  filter(produto == "Notebook") |> 
  pull(valor_total)  # pull(): extrai uma coluna como vetor (útil para resultados únicos)
print("Valores de venda de Notebooks (primeiros 10):")
print(head(valores_venda, 10))

# SLICE_MAX / SLICE_MIN - Atalho para arrange() + slice()
top3_valor <- vendas |>
  slice_max(valor_total, n = 3)  # slice_max(): retorna as n linhas com maior valor na coluna
print("Top 3 maiores vendas:")
print(top3_valor |> select(produto, valor_total))

bottom3_preco <- vendas |>
  slice_min(preco_unitario, n = 3)  # slice_min(): retorna as n linhas com menor valor
print("3 produtos mais baratos:")
print(bottom3_preco |> select(produto, preco_unitario))

# slice_max/min por grupo: maior venda de cada estado
top_por_estado <- vendas |>
  group_by(cliente_estado) |>
  slice_max(valor_total, n = 1) |>
  ungroup()
print("Maior venda por estado:")
print(top_por_estado |> select(cliente_estado, produto, valor_total))

# ============================================
# 8. JOIN - Combinação de datasets
# ============================================

print("\n=== JOIN ===")
# Funções join: combinam dois data frames baseado em colunas comuns

# Criando dataset de produtos para join
produtos_info <- tibble(
  produto = c("Notebook", "Mouse", "Teclado", "Monitor", "Webcam"),
  fornecedor = c("Dell", "Logitech", "Logitech", "Samsung", "Logitech"),
  garantia_meses = c(24, 12, 12, 36, 12),
  peso_kg = c(2.5, 0.2, 0.5, 3.0, 0.3)
)

print("Tabela de produtos:")
print(produtos_info)

# Left join: mantém todas as linhas da tabela da esquerda (vendas)
vendas_com_fornecedor <- vendas |> 
  left_join(produtos_info, by = "produto")  # left_join(): adiciona colunas da direita quando há correspondência
print("Left join (vendas + produtos):")
print(head(vendas_com_fornecedor |> select(produto, fornecedor, garantia_meses)))

# Outros tipos de join:
# inner_join(x, y): mantém apenas linhas que existem em ambas tabelas
# right_join(x, y): mantém todas linhas da tabela da direita
# full_join(x, y): mantém todas linhas de ambas tabelas

# SEMI_JOIN - Retorna linhas da esquerda que TÊM correspondência na direita
#             (sem adicionar colunas da tabela da direita)
produtos_com_venda <- produtos_info |>
  semi_join(vendas, by = "produto")  # semi_join(): filtra por existência, não adiciona colunas
print("Produtos que tiveram ao menos uma venda (semi_join):")
print(produtos_com_venda)

# ANTI_JOIN - Retorna linhas da esquerda que NÃO TÊM correspondência na direita
# Muito útil para encontrar "o que está faltando"
clientes_novos <- tibble(produto = c("Notebook", "Headset", "Impressora"))
produtos_sem_info <- clientes_novos |>
  anti_join(produtos_info, by = "produto")  # anti_join(): retorna apenas o que não tem par
print("Produtos sem cadastro em produtos_info (anti_join):")
print(produtos_sem_info)

# ============================================
# 9. FUNÇÕES DO TIDYR (PACOTE DENTRO DO TIDYVERSE)
# ============================================

print("\n=== TIDYR - PARA DADOS ORGANIZADOS ===")

# Criando dados desorganizados para exemplo
dados_desorganizados <- tibble(
  produto = c("Notebook", "Mouse", "Teclado"),
  "2024-01" = c(10, 20, 15),
  "2024-02" = c(12, 22, 18),
  "2024-03" = c(15, 25, 20)
)
print("Dados desorganizados (largos):")
print(dados_desorganizados)

# PIVOT_LONGER - Transforma de formato largo para longo
dados_organizados <- dados_desorganizados |> 
  pivot_longer(  # pivot_longer(): "despivota" dados, transformando colunas em linhas
    cols = starts_with("2024"),  # Colunas a serem transformadas
    names_to = "mes",  # Nome da nova coluna que conterá os nomes originais
    values_to = "quantidade"  # Nome da coluna que conterá os valores
  )
print("Dados organizados (longos):")
print(dados_organizados)

# PIVOT_WIDER - Transforma de formato longo para largo
dados_recuperados <- dados_organizados |> 
  pivot_wider(  # pivot_wider(): "pivota" dados, transformando valores únicos em colunas
    names_from = mes,  # Coluna cujos valores viram nomes de novas colunas
    values_from = quantidade  # Coluna que fornece os valores para preencher
  )
print("Dados restaurados para formato largo:")
print(dados_recuperados)

# SEPARATE - Divide uma coluna em múltiplas
dados_com_data <- tibble(
  id = 1:3,
  data_completa = c("2024-01-15", "2024-02-20", "2024-03-25")
) |> 
  separate(  # separate(): divide uma coluna em várias baseado em separador
    data_completa, 
    into = c("ano", "mes", "dia"),  # Nomes das novas colunas
    sep = "-"  # Caractere separador
  )
print("Coluna separada:")
print(dados_com_data)

# UNITE - Combina múltiplas colunas em uma
dados_unidos <- dados_com_data |> 
  unite(  # unite(): combina múltiplas colunas em uma
    data_unida,  # Nome da nova coluna
    ano, mes, dia,  # Colunas a serem combinadas
    sep = "/"  # Separador entre os valores
  )
print("Colunas unidas:")
print(dados_unidos)

# FUNÇÕES PARA DADOS AUSENTES (NAs)
# Criando dados com valores ausentes para demonstração
dados_com_na <- tibble(
  produto = c("Notebook", "Mouse", "Teclado", NA, "Webcam"),
  preco   = c(1500, NA, 200, 300, NA),
  estoque = c(10, 5, NA, NA, 3)
)
print("Dados com NAs:")
print(dados_com_na)

# DROP_NA - Remove linhas com NA em colunas específicas (ou em qualquer coluna)
sem_na_preco <- dados_com_na |>
  drop_na(preco)  # drop_na(): remove linhas com NA na coluna especificada
print("Removendo linhas com NA em preco:")
print(sem_na_preco)

sem_qualquer_na <- dados_com_na |>
  drop_na()  # Sem argumento: remove linhas com NA em QUALQUER coluna
print("Removendo linhas com NA em qualquer coluna:")
print(sem_qualquer_na)

# REPLACE_NA - Substitui NAs por um valor específico por coluna
dados_preenchidos <- dados_com_na |>
  replace_na(list(
    preco   = 0,
    estoque = 0,
    produto = "Desconhecido"
  ))  # replace_na(): substitui NA por valor definido em cada coluna
print("NAs substituídos por valores padrão:")
print(dados_preenchidos)

# FILL - Propaga o valor anterior (ou próximo) para preencher NAs
# Muito útil em séries temporais onde o grupo se repete
dados_serie <- tibble(
  mes    = 1:6,
  regiao = c("Sul", NA, NA, "Norte", NA, NA),
  vendas = c(100, 120, 90, 150, 80, 110)
)
print("Dados com NA em regiao:")
print(dados_serie)

dados_fill <- dados_serie |>
  fill(regiao, .direction = "down")  # fill(): preenche NAs com o último valor não-NA acima
print("NAs em regiao preenchidos (fill down):")
print(dados_fill)

# ============================================
# 10. EXERCÍCIOS PRÁTICOS
# ============================================

print("\n=== EXERCÍCIOS PRÁTICOS ===")

# Exercício 1: Produto com maior receita total
maior_receita <- vendas |> 
  group_by(produto) |> 
  summarise(receita = sum(valor_total)) |> 
  arrange(desc(receita)) |> 
  slice(1)  # Pega apenas a primeira linha (maior receita)
print("Exercício 1 - Produto com maior receita:")
print(maior_receita)

# Exercício 2: Vendas acima da média por estado
media_geral <- mean(vendas$valor_total)  # mean() fora do pipe para cálculo simples
vendas_acima_media <- vendas |> 
  group_by(cliente_estado) |> 
  summarise(
    vendas_acima_media = sum(valor_total > media_geral),  # sum() conta TRUE como 1
    percentual = vendas_acima_media / n() * 100  # Calcula porcentagem
  ) |> 
  arrange(desc(percentual))
print("Exercício 2 - Percentual de vendas acima da média por estado:")
print(vendas_acima_media)

# Exercício 3: Produtos que mais vendem em quantidade
top_produtos_qtd <- vendas |> 
  group_by(produto) |> 
  summarise(tot_quantidade = sum(quantidade)) |> 
  arrange(desc(tot_quantidade))
print("Exercício 3 - Produtos por quantidade total vendida:")
print(top_produtos_qtd)

# ============================================
# 11. FUNÇÕES DE UTILIDADE DO DPLYR
# ============================================

print("\n=== FUNÇÕES DE UTILIDADE ===")

# RELOCATE - Reposicionar colunas
vendas_reordenado <- vendas |> 
  relocate(valor_total, .after = preco_unitario)  # relocate(): move colunas para nova posição
print("Coluna valor_total movida para depois de preco_unitario:")
print(head(vendas_reordenado))

# ROWWISE - Operações linha a linha
vendas_por_linha <- vendas |> 
  rowwise() |>  # rowwise(): diz ao dplyr para operar linha por linha (não coluna por coluna)
  mutate(
    faixa_preco = case_when(
      preco_unitario < 100 ~ "Econômico",
      preco_unitario < 500 ~ "Médio",
      TRUE ~ "Premium"
    ),
    desconto_especial = ifelse(produto == "Notebook" & quantidade > 5, 0.15, 0)
  ) |>
  ungroup()  # ungroup(): remove agrupamento (importante limpar)
print("Operações linha a linha:")
print(head(vendas_por_linha |> select(produto, preco_unitario, faixa_preco, desconto_especial)))

# ACROSS - Aplicar função a múltiplas colunas
vendas_transformado_colunas <- vendas |> 
  mutate(across(  # across(): aplica transformação a múltiplas colunas
    .cols = c(quantidade, preco_unitario),  # Colunas a serem transformadas
    .fns = ~ .x * 1.1  # Fórmula (~) aplica 10% de aumento
  ))
print("Aplicando transformação a múltiplas colunas:")
print(head(vendas_transformado_colunas |> select(quantidade, preco_unitario)))

# WHERE - Selecionar colunas baseado em tipo (usado com across)
vendas_numericas <- vendas |> 
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))  # where(): seleciona colunas por tipo
print("Médias das colunas numéricas:")
print(vendas_numericas)

# ============================================
# 12. EXPORTAÇÃO DE RESULTADOS
# ============================================

print("\n=== EXPORTAÇÃO DE RESULTADOS ===")

# Exportar resultado como CSV
# write_csv(analise_completa, "analise_vendas.csv")  # write_csv(): exporta para CSV (sem row names)
# write_csv2(analise_completa, "analise_vendas.csv")  # write_csv2(): versão com separador ; (português)

# Para Excel (requer pacote writexl)
# install.packages("writexl")
# write_xlsx(list(vendas = vendas, resumo = vendas_por_produto), "relatorio_vendas.xlsx")

# ============================================
# 13. STRINGR - MANIPULAÇÃO DE STRINGS
# ============================================

print("\n=== STRINGR ===")
# O pacote stringr (carregado com o tidyverse) padroniza funções para texto.
# Todas as funções começam com str_ e aceitam vetores e pipes.

dados_texto <- tibble(
  descricao = c("  notebook Dell i7  ", "MOUSE Logitech MX", "teclado mecânico RGB",
                "Monitor 4K Samsung", "webcam HD 1080p"),
  codigo    = c("NB-001", "MS-002", "TC-003", "MN-004", "WC-005"),
  tags      = c("laptop,computador,dell", "mouse,periférico", "teclado,mecânico,rgb",
                "monitor,4k,tela", "webcam,câmera,hd")
)

# STR_TRIM - Remove espaços nas bordas da string
dados_texto <- dados_texto |>
  mutate(descricao = str_trim(descricao))  # str_trim(): remove espaços no início e no fim
print("Após str_trim:")
print(dados_texto$descricao)

# STR_TO_LOWER / STR_TO_UPPER / STR_TO_TITLE - Conversão de capitalização
dados_texto <- dados_texto |>
  mutate(
    desc_lower = str_to_lower(descricao),   # str_to_lower(): tudo em minúsculas
    desc_upper = str_to_upper(descricao),   # str_to_upper(): tudo em maiúsculas
    desc_title = str_to_title(descricao)    # str_to_title(): primeira letra de cada palavra em maiúscula
  )
print("Conversões de capitalização:")
print(dados_texto |> select(descricao, desc_lower, desc_title))

# STR_LENGTH - Comprimento (número de caracteres) da string
dados_texto <- dados_texto |>
  mutate(n_chars = str_length(descricao))  # str_length(): conta caracteres
print("Comprimento das descrições:")
print(dados_texto |> select(descricao, n_chars))

# STR_DETECT - Verifica se a string contém um padrão (retorna TRUE/FALSE)
# Pode ser usado dentro de filter() para buscar texto
tem_hd <- dados_texto |>
  filter(str_detect(descricao, regex("HD", ignore_case = TRUE)))  # str_detect(): detecta padrão (aceita regex)
print("Produtos com 'HD' na descrição:")
print(tem_hd$descricao)

# STR_REPLACE / STR_REPLACE_ALL - Substitui padrão na string
dados_texto <- dados_texto |>
  mutate(
    codigo_underscore = str_replace(codigo, "-", "_"),           # str_replace(): substitui primeira ocorrência
    desc_sem_numeros  = str_replace_all(descricao, "[0-9]", "")  # str_replace_all(): substitui todas as ocorrências
  )
print("Código com hífen substituído por underscore:")
print(dados_texto$codigo_underscore)

# STR_C e STR_GLUE - Concatenar e interpolar strings
dados_texto <- dados_texto |>
  mutate(
    label       = str_c(codigo, ": ", desc_title),                         # str_c(): concatena strings
    label_glue  = str_glue("{codigo} - {desc_title} ({n_chars} caracteres)")  # str_glue(): interpolação de variáveis
  )
print("Labels com str_c:")
print(dados_texto$label)
print("Labels com str_glue:")
print(dados_texto$label_glue)

# STR_SPLIT - Divide a string em partes (retorna lista)
tags_divididas <- dados_texto |>
  mutate(lista_tags = str_split(tags, ","))  # str_split(): divide por separador, retorna lista
print("Tags divididas (3 primeiras linhas):")
print(head(tags_divididas$lista_tags, 3))

# Aplicando stringr junto com dplyr: filtrar por padrão de texto
vendas_m <- vendas |>
  filter(str_detect(produto, "^M"))  # Produtos cujo nome começa com "M"
print("Produtos começando com 'M':")
print(distinct(vendas_m, produto))

# ============================================
# 14. PURRR - PROGRAMAÇÃO FUNCIONAL
# ============================================

print("\n=== PURRR ===")
# O pacote purrr (carregado com o tidyverse) fornece ferramentas para programação funcional.
# A ideia central é substituir loops por funções que aplicam operações a cada elemento.

# MAP - Aplica uma função a cada elemento de uma lista/vetor e retorna uma lista
precos <- list(notebook = 1500, mouse = 80, teclado = 200)

impostos <- map(precos, ~ .x * 0.18)  # map(): aplica função a cada elemento; ~ inicia função anônima, .x é o elemento
print("Impostos calculados com map() (retorna lista):")
print(impostos)

# Variantes com tipo de retorno definido (mais seguras e diretas):
# map_dbl(): retorna vetor numérico (double)
impostos_vetor <- map_dbl(precos, ~ .x * 0.18)
print("Impostos como vetor (map_dbl):")
print(impostos_vetor)

# map_chr(): retorna vetor de caracteres
labels_precos <- map_chr(precos, ~ paste0("R$ ", format(.x, big.mark = ".", decimal.mark = ",")))
print("Labels formatados (map_chr):")
print(labels_precos)

# map_lgl(): retorna vetor lógico
caro <- map_lgl(precos, ~ .x > 500)  # map_lgl(): retorna vetor TRUE/FALSE
print("Produto caro? (map_lgl):")
print(caro)

# MAP aplicado a colunas de um data frame: calcular média de todas as colunas numéricas
medias <- vendas |>
  select(where(is.numeric)) |>
  map_dbl(mean)
print("Média de cada coluna numérica:")
print(round(medias, 2))

# MAP com data frames aninhados: aplicar análise por grupo
resumo_grupos <- vendas |>
  group_by(produto) |>
  group_split() |>                        # group_split(): divide em lista de data frames por grupo
  map(\(df) tibble(                       # \(df) é sintaxe de função anônima nativa (R 4.1+)
    produto       = unique(df$produto),
    n             = nrow(df),
    receita_total = sum(df$valor_total),
    media_preco   = mean(df$preco_unitario)
  )) |>
  list_rbind()                            # list_rbind(): combina lista de data frames em um único
print("Resumo por produto via map():")
print(resumo_grupos)

# MAP2 - Aplica função a dois vetores em paralelo
quantidades_ex    <- c(5, 3, 8)
precos_unitarios_ex <- c(1500, 80, 200)
totais <- map2_dbl(quantidades_ex, precos_unitarios_ex, ~ .x * .y)  # map2(): dois inputs em paralelo
print("Valores totais com map2_dbl:")
print(totais)

# KEEP / DISCARD - Filtrar elementos de uma lista por condição
vendas_por_estado <- group_split(vendas, cliente_estado)
names(vendas_por_estado) <- sort(unique(vendas$cliente_estado))

estados_grandes  <- keep(vendas_por_estado, ~ nrow(.x) > 15)    # keep(): mantém elementos que satisfazem condição
estados_pequenos <- discard(vendas_por_estado, ~ nrow(.x) > 15)  # discard(): remove elementos que satisfazem condição
print("Estados com mais de 15 vendas:")
print(names(estados_grandes))
print("Estados com 15 ou menos vendas:")
print(names(estados_pequenos))

print("Script concluído! Os dados foram manipulados com sucesso usando tidyverse.")

# RESUMO DAS PRINCIPAIS FUNÇÕES DO TIDYVERSE:
#
# PIPES (encadeamento):
# - |>    : pipe nativo do R (4.1+), sem dependência de pacote
# - |>   : pipe do magrittr/dplyr, suporta placeholder "."
#
# DPLYR (manipulação):
# - filter():      filtrar linhas
# - select():      selecionar colunas
# - mutate():      criar/modificar colunas
# - summarise():   resumir dados
# - group_by():    definir grupos
# - arrange():     ordenar dados
# - rename():      renomear colunas
# - slice():       selecionar linhas por posição
# - slice_max():   linhas com maiores valores
# - slice_min():   linhas com menores valores
# - pull():        extrair coluna como vetor
# - relocate():    reposicionar colunas
# - rowwise():     operações linha a linha
# - across():      aplicar função a múltiplas colunas
# - left_join():   join mantendo todas as linhas da esquerda
# - inner_join():  join mantendo apenas correspondências
# - semi_join():   filtrar pela existência em outra tabela (sem adicionar colunas)
# - anti_join():   filtrar pela ausência em outra tabela
#
# TIDYR (organização):
# - pivot_longer(): largo para longo
# - pivot_wider():  longo para largo
# - separate():     dividir colunas
# - unite():        combinar colunas
# - drop_na():      remover linhas com NA
# - replace_na():   substituir NA por valor padrão
# - fill():         propagar valor anterior para preencher NAs
#
# STRINGR (strings):
# - str_trim():         remover espaços nas bordas
# - str_to_lower/upper/title(): converter capitalização
# - str_length():       comprimento da string
# - str_detect():       detectar padrão (retorna lógico)
# - str_replace():      substituir primeira ocorrência
# - str_replace_all():  substituir todas as ocorrências
# - str_c():            concatenar strings
# - str_glue():         interpolação de variáveis em strings
# - str_split():        dividir string em partes
#
# PURRR (programação funcional):
# - map():        aplica função a cada elemento, retorna lista
# - map_dbl():    retorna vetor numérico
# - map_chr():    retorna vetor de caracteres
# - map_lgl():    retorna vetor lógico
# - map2():       aplica função a dois vetores em paralelo
# - keep():       filtra elementos que satisfazem condição
# - discard():    remove elementos que satisfazem condição
# - list_rbind(): combina lista de data frames em um único
#
# OUTROS:
# - tibble():   criar tibble
# - glimpse():  visualizar estrutura
# - count():    contagem rápida
# - distinct(): valores únicos