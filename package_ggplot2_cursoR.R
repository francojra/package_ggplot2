
# Package ggplot2 --------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 12/04/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://livro.curso-r.com/8-1-o-pacote-ggplot2.html --------------------------------------------------------------------------

# O pacote ggplot2 -------------------------------------------------------------------------------------------------------------------------

## A construção de gráficos no R foi revolucionada com a criação do pacote ggplot2, fruto da tese de
## doutorado do Hadley Wickham. Essa revolução teve base na filosofia que Hadley adotou para responder
## a pergunta "o que é um gráfico estatístico?"

## Em 2005, o estatístico norte-americano Leland Wilkinson publicou o livro The Grammar of graphics 
## (A gramática dos gráficos, em português), uma fonte de princípios fundamentais para a construção 
## de gráficos estatísticos. No livro, ele defende que um gráfico é o mapeamento dos dados em 
## atributos estéticos (posição, cor, forma, tamanho) de formas geométricas (pontos, linhas, barras,
## caixas).

## A partir dessa definição, Hadley escreveu A Layered Grammar of Graphics (Uma gramática em camada 
## dos gráficos), acrescentando que os elementos de um gráfico (dados, sistema de coordenadas, 
## rótulos, anotações, entre outros) são as suas camadas e que a construção de um gráfico se dá 
## pela sobreposição dessas camadas.

## Essa é a essência do ggplot2: construir um gráfico camada por camada.

## Além de uma filosofia bem fundamentada, o ggplot2 ainda traz outras vantagens em relação aos 
## gráficos do R base:

## - gráficos naturalmente mais bonitos;
## - fácil personalização (mais simples deixar o gráfico do jeito que você quer);
## - a estrutura padronizada das funções deixa o aprendizado mais intuitivo;
## - a diferença no código entre tipos diferentes de gráficos é muito pequena.

## Para discutir os principais aspectos da construção de gráficos com o ggplot2, vamos continuar 
## utilizando a base de filmes do IMDB. 

## Na próxima seção, vamos conhecer as principais funções do ggplot2 e começar a construir 
## nossos primeiros gráficos. Não se esqueça de instalar e carregar o pacote antes de rodar 
## os exemplos.

library(ggplot2)

# Gráficos de pontos (dispersão) -----------------------------------------------------------------------------------------------------------

## No ggplot2, os gráficos são construídos camada por camada, sendo a primeira delas 
## dada pela função ggplot() (repare que não tem o “2”). Essa função recebe um data frame 
## e cria a camada base do gráfico, o nosso canvas, onde acrescentaremos todos os outros 
## elementos (camadas).

## Se rodarmos apenas a função ggplot(), obteremos um painel em branco.

imdb <- readr::read_rds("imdb.rds")
View(imdb)

ggplot(data = imdb)

## Apesar de termos passado os dados para a função, precisamos especificar como as observações 
## serão mapeadas nos aspectos visuais do gráfico e quais formas geométricas serão utilizadas 
## para isso.

## O código abaixo constrói um gráfico de dispersão entre as variáveis orcamento e receita.

ggplot(imdb) +
  geom_point(mapping = aes(x = orcamento, y = receita))

## Observe que:

## - a primeira camada é dada pela função ggplot() e recebe a nossa base imdb;
## - a segunda camada é dada pela função geom_point(), especificando a forma 
## geométrica utilizada no mapeamento das observações (pontos);
## - as camadas são unidas com um +;
## - o mapeamento na função geom_point() recebe a função aes(), responsável 
## por descrever como as variáveis serão mapeadas nos aspectos visuais dos pontos 
## (a forma geométrica escolhida);
## - neste caso, os aspectos visuais mapeados são a posição do ponto no eixo x e 
## a posição do ponto no eixo y;
## - o Warning nos avisa sobre a exclusão das observações que possuem NA na variável 
## receita e/ou orcamento;
## - todas essas funções são do pacote {ggplot2}.

## A combinação da função ggplot() e de uma ou mais funções geom_() definirá o tipo de gráfico gerado.

## O primeiro argumento de qualquer função geom é o mapping. Esse argumento serve para mapear os 
## dados nos atributos estéticos da forma geométrica escolhida.  Ele sempre receberá a função aes(), 
## cujos argumentos vão sempre depender da forma geométrica que estamos utilizando.  No caso de 
## um gráfico de dispersão, precisamos definir a posição dos pontos nos eixos x e y.  
## No exemplo, a posição do ponto no eixo x foi dada pela coluna orcamento e a posição do ponto 
## no eixo y pela coluna receita.

## Podemos acrescentar uma terceira camada ao gráfico, desenhando a reta y = x para visualizarmos 
## os filmes que não se pagaram.

ggplot(imdb) +
  geom_point(mapping = aes(x = orcamento, y = receita)) +
  geom_abline(intercept = 0, slope = 1, color = "red")

## Os pontos abaixo da reta representam os filmes com orçamento maior que a receita, isto é, aqueles 
## que deram prejuízo.
