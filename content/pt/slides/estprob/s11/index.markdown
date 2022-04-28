---
title: Estatística e Probabilidade
summary: Aula 11
authors: [Ben Dêivide]
tags: [Estatística e Probabilidade, Ambiente R, Programação]
categories: [Curso]
slides:
#  css: night
# https://github.com/hakimel/reveal.js/tree/master/css/theme/source
# Choose a theme from https://github.com/hakimel/reveal.js#theming
# https://revealjs.com/themes/
# https://github.com/wowchemy/wowchemy-hugo-themes/issues/796
# https://bookdown.org/yihui/rmarkdown/revealjs.html
# https://github.com/hakimel/reveal.js/wiki/Plugins,-Tools-and-Hardware
# Tentativas:
# https://github.com/dzello/reveal-hugo
# https://github.com/rstudio/revealjs
# Esse componente serve apenas para os temas oficiais
  theme: 'solarized'
# Choose a code highlighting style (if highlighting enabled in `params.toml`)
# Light style: github. Dark style: dracula (default).
  highlight_style: dracula
# Como controlar a apresentacao:
# - Next: `Right Arrow` or `Space`
# - Previous: `Left Arrow`
# - Start: `Home`
# - Finish: `End`
# - Overview: `Esc`
# - Speaker notes: `S`
# - Fullscreen: `F`
# - Zoom: `Alt + Click`
# - [PDF Export](https://github.com/hakimel/reveal.js#pdf-export): `E`
---


{{< slide background-image="cap.png" >}}

# Estatística e Probabilidade
Aula 11 - Probabilidades
</br>

{{< icon name="user-tie" pack="fas" >}} [Ben Dêivide](https://bendeivide.github.io/) | {{< icon name="school" pack="fas" >}} [UFSJ](https://www.ufsj.edu.br/)
</br>
{{< icon name="book" pack="fas" >}} [Estatística e Probabilidade]({{< relref "/courses/epaec" >}})


---

{{< slide background-image="cap02.png" >}}

## Selo DC

[![](SeloDC-preto.png)](https://bendeivide.github.io/dc/)

---

{{< slide background-image="cap02.png" >}}

<section>
<h2>Teoria de conjuntos no contexto probabilístico
</h2>

<div id="def:expaleatorio" class="definicao" cap=5 titulo="(Experimento Aleatório)">

<p>Todo experimento cujo resultado não pode ser previsto antes de sua execução, é chamado de experimento aleatório.</p>
</br>
</div>
</section>

<section>
<h2>Exemplos</h2>
<div id="exem:espamos1" class="exemplo" cap=5 titulo="Espaço amostral">
<p>Lançar um dado equilibrado e observar o resultado obtido na face superior do dado.</p>
</div>

<div id="exem:espamos2" class="exemplo" cap=5 titulo="Espaço amostral">
<p>Observar o número de chamadas telefônicas que chegam a uma central telefônica em um determinado intervalo de tempo.</p>
</div>

<div <div id="exem:espamos2" class="exemplo" cap=5 titulo="Espaço amostral">
<p>Para a escolha ao acaso de uma lâmpada que acabou de sair do processo de fabricação, verificar o tempo de duração da lâmpada em funcionamento.</p>
</div>

</section>

<section>
<h2>Experimento aleatório</h2>

<p>Em um contexto aplicado, podemos estar interessados em estudar a resistência de um fio de cobre a uma determinada corrente</p>

{{< figure src="expaleatorio.png" title="" width="630" height="220" >}}

</section>

<section>

<h2>Espaço amostral</h2>

<div id="def:espamostral" class="definicao" cap=5 titulo="(Espaço amostral)">
<p>O conjunto de todos os resultados possíveis de um experimento, denotado por $ \Omega $, é chamado de espaço amostral.</p>
</br>
</div>
</br>

- Cada um dos elementos do espaço amostral é representado por `\(\omega\)`;
- Relações:
  - Pertinência: `\(\omega \in \Omega\)`;
  - Continência: `\(A \subset B \Leftrightarrow \omega \in A \Rightarrow \omega \in B\)`;
  - Equivalência: `\(A = B \Leftrightarrow A \subset B \textrm{ e } B \subset A\)`.

</section>

<section>

<h2>Espaços amostrais discretos e contínuos</h2>

<div id="def:espdisccont" class="definicao" cap=5 titulo="(Espaços amostrais discretos e contínuos)">

<p>Um espaço amostral é discreto se o conjunto dos possíveis resultados são finito ou infinito contável (ou enumerável). Um espaço amostral é dito contínuo se o conjunto dos possíveis resultados são infinitos não contável (ou não enumerável). </p>
</br>
</div>
</br>

</section>

<section>

<h2>Exemplo</h2>

<div id="exem:espdisccont" class="exemplo" font-size: "12px" cap=5 titulo="Câmera Flash">
<p>Considere um experimento em que você seleciona uma câmera de telefone celular e registra o tempo de recarga de um <i>flash</i>. Os resultados possíveis para o tempo dependem da resolução do temporizador e dos tempos máximo e mínimo de recarga. Entretanto, podemos definir inicialmente o espaço amostral em termos da reta real positiva ($\mathbb{R}_+$), isto é,</p>
\begin{align*}
  \Omega = \mathbb{R}_+  & = \{ x ~:~ x > 0\}.
\end{align*}
<p>Se soubermos que os tempos de recarga estão entre $ 1,5 $ e $ 5 $ segundos, podemos definir o espaço amostral da seguinte forma:</p>
\begin{align*}
  \Omega  & = \{ x ~:~ 1,5 \leq x \leq 5\}.
\end{align*}
<p>Caso, consideremos o tempo de recarga como "baixo", "médio" ou "alto", reescrevemos o espaço amostral como:</p>
\begin{align*}
  \Omega & =  \{ \textrm{baixo}, \textrm{médio}, \textrm{alto} \}.
\end{align*}
</br>
</div>

</section>

<section>

<h2>Exemplo (continuação...)</h2>

<div id="exem:espdisccont" class="exemplo" cap=5 titulo="Câmera Flash">
<p>Por fim, podemos considerar apenas o fato da câmera satisfazer ou não as especificações do tempo de recarga mínimo, e assim, podemos assumir como resultados para esse espaço amostral: "sim" ou não", isto é,</p>
\begin{align*}
  \Omega & =  \{\textrm{sim},~\textrm{não}\}.
\end{align*}
<p>Para as duas primeiras situações, temos exemplos de espaços amostrais contínuos, e nos dois últimos, exemplos de espaços amostrais discretos.</p>
</br>
</div>

</section>

<section>

<h2>Subconjunto</h2>

<div id="def:subcj" class="definicao" cap=5 titulo="(Subconjunto)">
<p>Se todo elemento do conjunto A é também elemento do conjunto B, então A é definido como um subconjunto de B, sendo representado $ A\subset B $ ou $ B\supset A $ (A está contido em B ou B contém A), em notação dizemos que:</p>
\begin{align*}
  A \subset B \Leftrightarrow A \subseteq B \textrm{ e } A \neq B.
\end{align*}
</br>
</div>

- Essa definição pode ser aplicada também a subconjuntos de $ \Omega $, como apresentado no Exemplo sobre subconjuntos, a seguir.

</section>

<section>

<h2>Exemplo</h2>

<div id="exem:subconjunto" class="exemplo" cap=5 titulo="">

<p>Sejam os subconjuntos de $ \Omega $ do experimento aleatório apresentado no Exemplo sobre espaços amostrais, dos quais temos:</p>
\begin{align*}
B=\{ 1,2,3,4 \} \ \mbox{ e } \ A= \{ 1,2,3 \},
\end{align*}
<p>então A é um subconjunto de B, pois, os elementos que contém em A, também contém em B.</p>
</br>

</div>

</section>

<section>

<h2>Evento</h2>

<div id="def:subcj" class="definicao" cap=5 titulo="(Evento)">
</br>
<p>Se todo elemento do conjunto A é também elemento do conjunto B, então A é definido como um subconjunto de B, sendo representado $ A\subset B $ ou $ B\supset A $ (A está contido em B ou B contém A), em notação dizemos que:</p>
\begin{align*}
  A \subset B \Leftrightarrow A \subseteq B \textrm{ e } A \neq B.
\end{align*}
</br>
</div>

</section>

<section>

<h2>Exemplo</h2>

<div id="exem:subcj2" class="exemplo" cap=5 titulo="">

<p>Um experimento lança três moedas honestas, e deseja-se verificar a face superior dessas moedas. Sabe-se que cada moeda apresenta duas faces: cara (H) e coroa (T). Dessa forma, o espaço amostral é dado por:</p>
\begin{align*}
\Omega = &\{(H,H,H),(H,H,T),(H,T,H),(H,T,T),\\
       & (T,H,H),(T,H,T),(T,T,H),(T,T,T)\}.
\end{align*}
<p>Um evento retirado desse espaço amostral seria $ A=\{(H,H,H) $, $ (H,H,T) $, $ (H,T,T) \} $, ou seja, o evento em que dos três arremessos de moedas, tenha saído "cara" na primeira moeda.</p>
</div>

</section>

<section>

<h2>Evento certo, impossível e elementar</h2>

<div id="def:eventosbasicos" class="definicao" cap=5 titulo="(Evento certo, impossível e elementar)">
<p>Seja $ \Omega $ o espaço amostral do experimento. Então dizemos que $ \Omega $ é o evento certo, e $ \emptyset $ é o evento impossível, e o evento $ \{\omega\} $ é dito elementar.</p>
</div>

</section>

<section>

<h2>Conjunto vazio</h2>

<div id="def:conjvazio" class="definicao" cap=5 titulo="(Conjunto vazio)">
<p>Se o conjunto A não contém nenhum elemento, então A é chamado de conjunto nulo ou conjunto vazio, ou seja, $ A=\varnothing $ ou $ A=\{ \ \} $, isto é,</p>
\begin{align*}
  A & = \{\omega \in \Omega: \omega \neq \omega \}.
\end{align*}
</br>
</div>

</section>

<section>

<h2>União de dois eventos</h2>

<div id="def:udoisevt" class="definicao" cap=5 titulo="(União de dois eventos)">
<p>Sejam A e B, dois eventos quaisquer de $ \Omega $, então o conjunto de todos os elementos que estão em A ou B ou em ambos, é definido como o conjunto união de A e B, denotado por $ A\cup B $, tal que,</p>
\begin{align*}
  A\cup B & = \{\omega \in \Omega: ~\omega \in A \textrm{ ou } \omega \in B\}.
\end{align*}
</br>
</div>

</section>

<section>

<h2>Exemplo</h2>

<div id="exem:udoisevt" class="exemplo" cap=5 titulo="">
<p>Sejam os conjuntos:</p>
\begin{align*}
  A & =\{1,2,3\} \ \mbox{e} \ B=\{3,4,5,6\},
\end{align*}
<p>então</p>
\begin{align*}
  A\cup B & =\{1,2,3,4,5,6\}.
\end{align*}
</br>
</div>

</section>

<section>

<h2>Interseção de dois eventos</h2>

<div id="def_inteventos" class="definicao" cap=5 titulo="(Interseção de dois eventos)">
<p>Sejam A e B, dois eventos quaisquer de $ \Omega $, então o conjunto que contém todos os elementos que estão em A e B, é definido como a interseção de A e B, denotado por $ A\cap B $ ou $ AB $, tal que,</p>
\begin{align*}
  A \cap B & = \{\omega \in \Omega: ~\omega \in A \textrm{ e } \omega \in B\}.
\end{align*}
</br>
</div>
<br>

- Do Exemplo sobre união de eventos, temos que a intersecção de $ AB = \{3\} $.


</section>

<section>

<h2>Eventos Disjuntos ou multuamente exclusivos</h2>

<div id="def:disjeventos" class="definicao" cap=5 titulo="(Eventos Disjuntos ou multuamente exclusivos)">
<p>Sejam A e B, dois eventos quaisquer de $ \Omega $, então estes são disjuntos ou mutuamente exclusivos quando não existir elementos em comum entre A e B, isto é, $ A\cap B = \emptyset $.</p>
</div>


</section>

<section>

<h2>Exemplo</h2>

<div id="exem:disjeventos" class="exemplo" cap=5 titulo="">
<p>Sejam os eventos $ A=\{1,2,3,4\} $ e $ B=\{5,6\} $, então $ A\cap B=\varnothing $.</p>
</br>
</div>

</section>

<section>

<h2>Eventos equivalentes</h2>

<div id="def:equieventos" class="definicao" cap=5 titulo="(Eventos equivalentes)">
<p>Dois eventos $ A $ e $ B $ são definidos equivalentes, ou iguais, se $ A\subseteq B $ e $ B \subseteq A $.</p>
</div>


</section>

<section>

<h2>Exemplo</h2>

<div id="exem:equieventos" class="exemplo" cap=5 titulo="">
<p>Sejam os eventos $ A=\{1,2,3,4\} $ e $ B=\{5,6\} $, então $ A\cap B=\varnothing $.</p>
</br>
</div>

</section>

<section>

<h2>Evento complementar</h2>

<div id="def:compevento" class="definicao" cap=5 titulo="(Evento Complementar)">
<p>Seja $ A $ um evento de $ \Omega $. Então o complemento do evento A com respeito a $ \Omega $, denotado por $ \overline{A} $, $ A^c $, ou $ \Omega-A $, é o subconjunto dos elementos de $ \Omega $ exceto os elementos do evento A, isto é,</p>
\begin{align*}\label{compeventos}
  A^c & = \{\omega \in \Omega: ~ \omega \notin A\}.
\end{align*}
</br>
</div>

</section>

<section>

<h2>Exemplo</h2>

<div id="exem:compevento" class="exemplo" cap=5 titulo="">
<p>Seja o espaço amostral  $ \Omega $ do experimento que consiste em arremessar três moedas honestas. Diremos que $ H $ consiste na face superior da moeda ser cara, e $ T $ coroa. Assim,</p>
\begin{align*}
\Omega = &\{(H,H,H),(H,H,T),(H,T,H),(H,T,T),\\
& (T,H,H),(T,H,T),(T,T,H),(T,T,T)\}.
\end{align*}
<p>e um subconjunto de $ \Omega $, cujo evento será aparecer cara na primeira moeda, dado por</p>
$$ A=\{(H,H,H),(H,H,T),(H,T,H), (H,T,T)\}. $$
<p>Então o complemento de A será:</p>
$$ \overline{A}=\{(T,H,H),(T,H,T), (T,T,H), (T,T,T)\}. $$
</br>
</div>

</section>

<section>

<h2>Diferença de dois eventos</h2>

<div id="def:difeventos" class="definicao" cap=5 titulo="(Diferença de dois eventos)">
<p>Sejam A e B dois eventos de $ \Omega $. O conjunto de todos os elementos de $ A $ que não estão em $ B $, serão denotados por $ A-B $ ou $ A\setminus B $, sendo definido por conjunto diferença, isto é,</p>
\begin{align*}
  A - B & = \{\omega \in \Omega: ~\omega \in A \textrm{ e } \omega \notin B\}.
\end{align*}
</br>
</div>
<aside class="notes">
  📝 A Definição  de diferença de conjuntos pode ser confundida com a Definição evento complementar, porém esta última se remete ao espaço amostral, e a diferença entre dois eventos se refere apenas a existência dos elementos de um evento que não estão em outro evento. Vejamos o Exemplo diferença de evendos, e depois compare com o Exemplo de evento complementar, para elucidar essas duas definições.
</aside>

</section>

<section>

<h2>Exemplo</h2>

<div id="exem:compevento" class="exemplo" cap=5 titulo="">
<p> Sejam os conjuntos $ A=\{1,2,3,4\} $ e $ B =\{3,4\} $, então $ A-B=\{1,2\} $. </p>
</br>
</div>

</section>

<section>

<h2>Partição</h2>

<div id="def:particao" class="definicao" cap=5 titulo="(Partição)">
<p>Considerando uma sequência de eventos $ A_1 $, $ A_2 $, $ \ldots $, $ A_n $, não vazios, é uma partição do evento $ A $, se e somente se,</p>

- $ A = \bigcup_{i = 1}^{n}A_i $;
- $ A_1 $, $ A_2 $, $ \ldots $, $ A_n $ são multuamente disjuntos, tais que $ A_i \cap A_j, ~\forall i \neq j $.
</br>
</div>
</section>

<section>

<h2>Leis na teoria de conjuntos</h2>

<div id="def:leiconj" class="definicao" cap=5 titulo="(Leis na teoria de conjuntos)">
<p>Considere três eventos $ A $, $ B $, e $ C $ definidos em $ \Omega $, então segue que:</p>

- Lei comutativa: $ A\cup B = B \cup A$ e  $A\cap B = B \cap A $;
- Lei associativa: $ A \cup (B\cup C)=(A\cup B)\cup C $;
- Lei distributiva: $ A \cup (B \cap C)=(A\cup B)\cap (A\cup C) $ e $ A \cap (B \cup C)=(A\cap B)\cup (A\cap C) $;
- Lei DeMorgan: $ (A \cup B)^c = A^c \cap B^c $ e $( A \cap B)^c = A^c \cup B^c $.
</br>
</div>
</br>
<div id="prova:leiconj" class="prova" cap=5 titulo="">
<p>Ver livro <a href="https://bendeivide.github.io/book-epaec/">EPAEC</a>!. </p>
</div>
</section>

<section>

<h2>Identidades em conjuntos</h2>

<div id="def:identconj" class="definicao" cap=5 titulo="(Identidade em conjuntos)">
<p>Sejam os eventos $ A $ e $ B $ definidos no espaço amostral  $ \Omega $, não vazio. Então, apresentamos as seguintes identidades:</p>

- $ A\cap A^c = \emptyset $;
- $ A \cup A^c = \Omega $;
- $ \Omega^c = \emptyset $;
- $ \emptyset^c = \Omega $;
- $ (A^C)^C=\overline{(\overline{A})}=A $, em outras palavras, o complemento de $ \overline{A} $ é igual a $ A $;
- $ A\Omega=A $ (Elemento neutro);
- $ A\cup \Omega=\Omega $;
- $ A \cap A = A $ (Idempotência);
- $ A\varnothing=\varnothing $ (Elemento absorvente);
- $ A\cup \varnothing = A $;
- $ A - B = A - (A \cap B) = A \cap B^c $;
- `\(B = (B \cap A) \cup (B \cap A^c)\)`;
- `\(B - A = B \cap A^c\)`;
- `\(A \cup B = A \cup (B \cap A^c)\)`;
- `\(A \cup B = (A^c \cap B)\cup (A \cap B) \cup (A \cap B^c)\)`.

</br>
</div>
</br>

</section>

---

{{< slide background-image="cap02.png" >}}

# Questões?

[Dúvidas e Sugestões](https://bendeivide.github.io/)

[Contato](https://bendeivide.github.io/#contact)
