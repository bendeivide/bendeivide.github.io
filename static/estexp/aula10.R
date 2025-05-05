###############################################
# AULA 10 - DELINEAMENTO EM BLOCOS CASUALIZADOS
# DISCIPLINA: Estatistica Experimental
# Prof. Ben Deivide | UFSJ
# https://bendeivide.github.io/courses/estexp
###############################################


# Problema

## Um laboratório de Engenharia Mecatrônica deseja comparar o desempenho 
## de 4 algoritmos de controle (PID, LQR, Fuzzy, e MPC) aplicados ao controle 
## de posição de braços robóticos. No entanto, cada braço robótico possui 
## equenas diferenças construtivas (motores, atuadores, folgas), o que 
## pode influenciar os resultados.
## Para reduzir a variabilidade associada a cada braço, foi adotado 
## um Delineamento em Blocos Casualizados (DBC), onde os blocos são 
## os 5 braços robóticos disponíveis no laboratório, e os tratamentos 
## são os 4 algoritmos.
## Cada algoritmo foi testado uma vez em cada braço, e a resposta 
## medida foi o erro médio absoluto (EMA) de posicionamento em milímetros 
## (quanto menor, melhor o desempenho).

# Pacotes
library(agricolae) # para o teste de Tukey com DBC
library(ggplot2)
library(dplyr)

# Dados simulados
dados <- data.frame(
  braco = factor(rep(1:5, each = 4)),
  algoritmo = factor(rep(c("PID", "LQR", "Fuzzy", "MPC"), times = 5)),
  erro = c(
    2.3, 1.8, 2.0, 1.5,   # Braço 1
    2.5, 2.1, 2.4, 1.7,   # Braço 2
    2.8, 2.2, 2.5, 1.9,   # Braço 3
    2.1, 1.9, 2.3, 1.6,   # Braço 4
    2.6, 2.0, 2.6, 1.8    # Braço 5
  )
)
# Exportar
write.csv2(dados, "ema_algoritmos.csv", row.names = FALSE)

# ANAVA
modelo <- aov(erro ~ braco + algoritmo, data = dados)
summary(modelo)

# Teste de Tukey com função do pacote agricolae
tukey <- HSD.test(modelo, "algoritmo", group = TRUE)
print(tukey)

# Obter médias e IC
media <- dados %>%
  group_by(algoritmo) %>%
  summarise(
    media = mean(erro),
    sd = sd(erro),
    n = n(),
    se = sd / sqrt(n),
    ic = qt(0.975, df = n - 1) * se
  )

# Gráfico
ggplot(media, aes(x = reorder(algoritmo, media), y = media)) +
  geom_col(fill = "steelblue", width = 0.6) +
  geom_errorbar(aes(ymin = media - ic, ymax = media + ic), width = 0.2) +
  ylab("Erro médio absoluto (mm)") +
  xlab("Algoritmo de Controle") +
  ggtitle("Comparação de algoritmos de controle - DBC") +
  theme_minimal()



