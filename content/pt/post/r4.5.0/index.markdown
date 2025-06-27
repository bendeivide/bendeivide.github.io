---
title: 'Atualizações do R (4.5.0)'
date: "2025-06-27"
categories: ['R', 'Programação', 'Linguagem']
tags: ['Linguagem R']
summary: 'Atualizações da nova versão do R publicada em 11/04/2025'
links:
- name: Notícias do R
  url: https://stat.ethz.ch/R-manual/R-devel/doc/html/NEWS.html
- name: Livro R Básico
  url: https://bendeivide.github.io/books/eambr01/
---






## 🆕 Lançamento do R 4.5.0 (“How About a Twenty‑Six”) — 11 de abril de 2025

O apelido **"How About a Twenty‑Six"** da versão **R 4.5.0** é um *trocadilho com referências internas da comunidade R*, e remete ao fato de que esta versão marca:

> **O 26º lançamento de uma versão principal da linguagem R.**

Ou seja:

* A numeração **4.5.0** corresponde à 26ª versão desde o **R 1.0.0**, lançado em fevereiro de 2000.
* “Twenty-Six” significa **26**, e o título “How About a Twenty‑Six” brinca com a ideia de sugerir casualmente esse marco histórico.



# 📊 Novo dataset “penguins”

* A célebre base Palmer Penguins, antes acessada via pacote externo, agora é disponibilizada nativamente em R, com duas versões: `penguins` e `penguins_raw`, ideal para tarefas de clustering, classificação e limpeza de dados ([r-bloggers.com][1]).

# 📥 Função `use()` para importar de forma seletiva

* Permite carregar apenas funções específicas de um pacote, sem poluir o namespace ou causar conflitos — por exemplo, `use("dplyr", c("filter","select"))`, sem atrapalhar funções base de mesmo nome ([r-bloggers.com][1]).

# ⬇️ Downloades paralelos de pacotes

* `install.packages()`, `download.packages()` e `update.packages()` agora podem baixar múltiplos pacotes simultaneamente, acelerando instalações e atualizações de forma significativa ([qubixity.net][2]).

# 🧩 Compilação com padrão C23

* Passou a usar, por padrão, compiladores compatíveis com C23 (ex.: GCC 13‑15, Clang 18‑20) em sistemas Unix, garantindo suporte a linguagens e melhorias modernas. Ainda há opção para retornar ao padrão antigo ([developer.r-project.org][3]).

# 🧠 Função `grepv()`

* Equivalente a `grep()` com `value = TRUE` por padrão, facilitando a extração direta de valores que correspondem ao padrão pesquisado ([developer.r-project.org][4]).

# 🧪 Outras novidades e melhorias

* Funções novas em `tools`: `check_package_urls()` e `check_package_dois()`.
* Métodos `head()` e `tail()` para objetos de série temporal (`ts`).
* Função `qr.influence()` para análise de influência em regressões.
* Suporte a compressão `zstd` em tarballs.
* Opções extras em `pdf()`, como `author`, `timestamp` e `producer`.
* Mais métodos para `duplicated()`, `unique()`, `seq.Date()` etc. ([developer.r-project.org][4]).

# ⚠️ Correções importantes

* BLAS/LAPACK: integração de novas rotinas `dgemmtr` e `zgemmtr` via LAPACK 3.12.1, o que pode exigir atenção a implementações BLAS externas ([developer.r-project.org][3]).
* Remoção da possibilidade de alterar atributos ou ambiente de funções primitivas — essas operações agora geram erro ou aviso ([developer.r-project.org][3]).

# ✅ Resumo final

| Área        | Destaques                                                            |
| ----------- | -------------------------------------------------------------------- |
| Datasets    | `penguins` e `penguins_raw` agora no base R                          |
| Importação  | `use()` para controle preciso de namespace                           |
| Instalação  | Downloads paralelos para pacotes                                     |
| Performance | Compilação padrão com C23 e novos BLAS/LAPACK                        |
| Utilidades  | `grepv()`, métodos `head()/tail()` para `ts`, e melhorias em `tools` |

# Referências

[1]: https://www.r-bloggers.com/2025/04/whats-new-in-r-4-5-0/?utm_source=chatgpt.com "What’s new in R 4.5.0? | R-bloggers"
[2]: https://qubixity.net/2025/04/11/whats-new-in-r-4-5-0-a-summary-of-exciting-changes/?utm_source=chatgpt.com "“What’s New in R 4.5.0: A Summary of Exciting Changes” | Qubixity.net"
[3]: https://developer.r-project.org/blosxom.cgi/R-4-5-branch/NEWS?utm_source=chatgpt.com "Daily News: R-4-5-branch/NEWS"
[4]: https://developer.r-project.org/blosxom.cgi/R-devel/2025/03/14?utm_source=chatgpt.com "Daily News: R-devel"
[5]: https://developer.r-project.org/?utm_source=chatgpt.com "R Developer Page"


