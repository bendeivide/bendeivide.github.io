---
title: R básico
subtitle: Coleção Estudando o Ambiente R (Volume I)
summary: "**(Livro publicado)** Sugestões e críticas sobre o livro podem ser enviadas para livrosdeben@gmail.com"
tags:
- bookeambr
categories: ["R"]
date: "2022-09-21 16:33:02"

# Optional external URL for project (replaces project detail page).
# external_link: "https://bendeivide.github.io/cdec/"
external_link: ""

image:
  caption: Foto criada por Ben Dêivide
  focal_point: Smart

links:
- icon: amazon
  icon_pack: fab
  name: Amazon (Colorido)
  url: https://www.amazon.com/dp/6500515994
- icon: amazon 
  icon_pack: fab
  name: Amazon (Preto e branco)
  url: https://www.amazon.com/dp/6500531914
- icon: book-open
  icon_pack: fas
  name: Bookdown
  url: https://bendeivide.github.io/book-eambr01/
- icon: file-pdf
  icon_pack: fas
  name: PDF
  url: https://github.com/bendeivide/book-eambr01/raw/main/docs/book-eambr01.pdf
- icon: github
  icon_pack: fab
  name: Acesse o projeto
  url: https://github.com/bendeivide/book-eambr01
- icon: twitter
  icon_pack: fab
  name: Siga-me
  url: https://twitter.com/bendeivide
- icon: facebook
  icon_pack: fab
  name: Siga-me
  url: https://facebook.com/bendeivide
- icon: instagram
  icon_pack: fab
  name: Siga-me
  url: https://instagram.com/bendeivide
- icon: youtube
  icon_pack: fab
  name: Se inscreva
  url: https://youtube.com/bendeivide

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
#slides: example
slides: ""

# Remove various "share" icons for portfolio widget
# Eles ficam em theme/starter-academic/data/page_sharer.toml
# Link de ajuda: https://github.com/wowchemy/wowchemy-hugo-modules/issues/1611
share: true
---

## Sugestões e críticas

Sugestões e críticas sobre o livro podem ser enviadas para [livrosdeben@gmail.com](mailto:livrosdeben@gmail.com).

## Onde consigo a versão em PDF?

[Livro R básico (PDF)](https://github.com/bendeivide/book-eambr01/raw/main/docs/book-eambr01.pdf)

## Onde consigo a versão em HTML?

[Livro R básico (HTML)](https://bendeivide.github.io/book-eambr01/)

## Onde consigo todos os *scripts* do livro?

O diretório de todos os *scripts* do livro se encontram em: [link](https://github.com/bendeivide/book-eambr01/tree/main/scripts)

## Onde consigo comprar o livro físico?

- [Versão colorida e capa simples (Amazon)](https://www.amazon.com/dp/6500515994)
- [Versão preto e branco e capa simples (Amazon)](https://www.amazon.com/dp/6500531914) (Mais em conta!)

## Sinopse

A coleção *Estudando o ambiente R* é fruto de cursos ministrados sobre essa linguagem, bem como consultorias e estudos ao longo dos anos. Em 2005, quando ingressei na academia no curso de Engenharia Agronômica fiquei fascinado com a disciplina de Estatística no segundo semestre do ano corrente. Na sequência, acabo tendo o primeiro contato com o ambiente R, com pouco mais de 9 anos de seu lançamento e redistribuição. Poucos materiais naquela época haviam disponíveis em língua portuguesa. Porém, foi o suficiente para eu entender que estava diante de uma grande ferramenta computacional e estatística, necessária para o entendimento, pois sabia que poderia me gerar além de conhecimento, bons frutos acadêmicos.

Hoje, no ano de 2021, usuário há mais de 15 anos dessa linguagem, percebi que me sentia desconfortável, como apenas usário dessa ferramenta de trabalho. E assim, quando queremos aprender algo não há ferramenta melhor do que *aprender por ensinar*. E assim, lotado no Departamento de Estatística, Física e Matemática ([DEFIM](http://defim.ufsj.edu.br/), campus Alto Paraopeba, pela Universidade Federal de São João del-Rei ([UFSJ](https://www.ufsj.edu.br/)), juntamente com o Centro Acadêmico de Engenharia de Telecomunicações (UFSJ), resolvemos em parceria, ministrar nesse momento de pandemia uma sequência de módulos para o curso R, desde o nível Básico até ao módulo Avançado.

A ideia desse curso foi apresentar algo diferente relacionado a maioria dos cursos em R, que foi sempre apresentar essa ferramenta dentro dos conceitos da área da Estatística. Apesar de uma coisa ser intrínseca a outra, há muitas particularidades no ambiente R que são complexos, e muitas vezes julgados erroneamente. Um dos exemplos clássicos é que *loops* em R são lentos e com alto gasto de memória, quando na realiadade, isso ocorre muitas vezes pelo não entendimento do sistema de cópia de objetos nesse ambiente. Ainda mais, o entendimento desses cursos é agravado porque o entendimento sobre a estatística além de um cunho matemático, tem o seu cunho filosófico de como as metodologias foram desenvolvidas, e o entendimento mútuo da Estatística e o ambiente R, podem não ter o conhecimento real que essa potencial ferramenta pode proporcionar, uma vez que muitos assuntos complexos podem estar envolvidos em uma única aula.

Assim, desenvolvemos na coleção *Estudando o ambiente R* os três volumes iniciais, referentes a apenas a linguagem R, sendo *Volume I: Nível Básico*, *Volume II: Nível Intermediário* e *Volume III: Nível Avançado*. Fazendo a alusão dos três livros iniciais sobre a linguagem S de John Chambers, faremos uma explanação sobre assuntos de menor complexidade até noções mais complexas sobre o ambiente R, restringindo apenas a sintaxe e semântica da linguagem. Os volumes subsequentes serão destinados a *Documentações no R*, *Desenvolvimento de pacote R*, *Gráficos*, *Banco de dados*, *Interface Gráfica ao Usuário*, *Interface R com outras linguagens*, *Programação Orientada a Objetos*, *Funções do pacote base*, dentre outros.

Tentando engajar nossos alunos, e agora colegas de trabalho, tenho a parceria no Volume I, de [Diego Arthur](https://digoarthur.github.io/), uma pessoa que tenta se superar a cada desafio e assunto estudado.

Esse primeiro volume, que representa o livro corrente, apresenta um breve __histórico__ sobre a linguagem, a sua instalação, bem como os recursos que a *IDE*[^1]

[^1]: Do inglês, *Integrated Development Environment*, que significa ambiente de desenvolvimento integrado.

RStudio, o conhecimento da __sintaxe__ e __semântica__ da linguagem R, compreendendo as estruturas bases da linguagem, sobre o que é um __objeto__ e como construir uma __função__, o entendimento sobre __fluxos de controle__. O que é um __pacote__, __carregar__ e __anexar__ um pacote, e quem são as pessoas que fazem parte da manutenção dessa linguagem, também serão assuntos desse primeiro módulo. __Caminho de busca__, __ambientes__ e __namespaces__, teremos noções básicas. Algo muito interessante, que pode mudar a vida de um programador em R são as __boas práticas para a escrita de um código__, tema também abordado nesse módulo.

A ideia desse volume é proporcionar um entendimento básico, um primeiro contato com a linguagem, fazendo com que o leitor possa dar os primeiros passos, executando as primeiras linhas de comando. Mas também, dando o enfoque com erros tão recorrentes, como o entendimento sobre um objeto, ou o anexo de um pacote no caminho de busca. Temas como esses, dentre outros, serão a forma inicial que encontramos, para que posteriormente, seja dado um aprofundamento sobre a estrutura de um objeto R bem como a sua manipulação, e adicionado a isso, a inserção de como são os paradigmas da programação nesse ambiente. 

Por fim, espero que esse primeiro volume possa servir de referência para os passos iniciais nessa ferramenta tão importante para a área de análise de dados.
