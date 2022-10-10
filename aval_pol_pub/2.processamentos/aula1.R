
# Muitas vezes, queremos usar codigo feito por outra pessoa que esta' em um pacote --
# o que nada mais e' que um amontoado de codigo com utilidades diversas. Instalamos
# um pacote com 'install.packages'. 


# Neste curso, usaremos muito o 'tidyverse'. Vamos instala-lo:
install.packages("tidyverse")


# Feito isso, podemos carrega-lo com:
library(tidyverse)


# Pronto, podemos usar suas funcoes. Para ter uma idea, elas sao mais de 300,
# incluindo desde de manipulacao de qualquer tipo de dado, navegacao na internet
# via httr ate' producao de graficos.


# Alem disso, o tidyverse vem com alguns bancos de dados (data.frames ou tibbles),
# que sao uteis para nos familiarizarmos com esse tipo de formato.


# Particularmente, o tidyverse tem um banco (salvo em um objeto) chamado band_members.
# Vamos tentar abri-lo.
band_members


# Ok, podemos fazer melhor.
View(band_members)


# Essa funcao, View, nao faz parte do tidyverse, mas e' util para visualizar dados
# como em uma planilha.


# Ou, melhor ainda, pra ser rapido e sintetico:
glimpse(band_members)


# Se quisermos apenas saber o nome de todas as variaveis em um data.frame, podemos usar:
names(band_members)


# Para saber o numero de linhas e de colunas, respectivamente:
nrow(band_members)

ncol(band_members)

# Usando $ para acessar dados
band_members$name
band_members$band

# Para adiantar um pouco do que veremos, o tidyverse cont???m in???meras funcoes que
# servem para manipular objetos como esses, os data.frames. A estrutura de todas
# elas e' bastante similar: funcao(data.frame, argumento).


# Vamos comecar com algumas operacoes simples, apenas para voces terem o feeling
# de como a coisa funciona. Suponhamos que, do data.frame 'band_members', eu
# queira preservar apenas a variavel 'name'. Como fazemos isso? Usando o tidyverse:
select(band_members, name)


# Para selecionar a variavel 'band', do mesmo modo, usamos:
select(band_members, band)


# Se quisermos selecionar as duas (o que nao faz tanto sentido aqui, mas sera' 
# no futuro):
select(band_members, band, name)


# Note que, com esse codigo, inclusive invertemos a ordem das variaveis. Caso
# voce queira fazer em isso em qualquer base, esse e' uma das formas.


# Antes de encerrar, vamos ver um tipo de select que funciona nas linhas, slice:
slice(band_members, 1)


# Viram? slice(data.frame, 1) pega a primeira linha de um deta.frame. Ela e'
# parecida com select, mas funciona nas linhas, na horizontal. Como pegar
# apenas a segunda linha de um banco? Facil:
slice(band_members, 2)


# E se eu quiser a primeira e a segunda? Existem algumas formas:
slice(band_members, 1, 2)


# Ou (note que estou usando vetores para fazer isso):
slice(band_members, 1:2)


# O que e' igual tambem a:
slice(band_members, c(1, 2))

# filtrar
band_members %>%
  filter(band=="Stones")


# Criar nova variavel

band_members %>%
  mutate(estilo = "Rock")

band_members %>%
  mutate(estilo = "Rock") %>%
  mutate(pais = "Inglaterra")


band_members %>%
  mutate(estilo = "Rock",
         pais = "Inglaterra")

band_members %>%
  mutate(estilo = "Rock",
         pais = "Inglaterra",
         show_ano = if_else(band=="Stones", 200, 50))


band_members %>%
  mutate(estilo = "Rock",
         pais = "Inglaterra",
         show_ano = if_else(band=="Stones", 200, 50),
         show_mes = show_ano/12)

# Esse comando limpa (apaga) todo ambiente

rm(list = ls())


#-----------------------------------------------------------------

#install.packages("tidyverse")
#install.packages("rio")
#install.packages("here")
#install.packages("rio")
#install.packages("gapminder")


# Feito isso, podemos carrega-lo com:
library(tidyverse)
library(rio)
library(here)
library(gapminder)



# Importar banco de dados da pasta 1.dados
dados <- import(here("1.dados/banco_gapminder.xlsx"))

View(dados)

glimpse(dados)
head(dados)
tail(dados)

summary(dados)
mean(dados$gdpPercap)
mean(dados$gdpPercap)
summary(dados$gdpPercap)
x <- mean(dados$gdpPercap)
x

dados <- filter(dados, lifeExp < 60)
dados <- filter(dados, lifeExp < 60 & gdpPercap < median(gdpPercap))
dados <- slice(dados, 1:100) # fica apenas com as 100 primeiras observacoes
names(dados)

# Podemos excluir uma variavel usando o operador - na frente:
dados <- select(dados, -3) # remove a terceira variavel do banco
names(dados)

# criar
dados <- mutate(dados, nova_variavel = log(pop),
                nova_variavel2 = 1)
names(dados)
dados <- mutate(dados, var1 = log(pop), var2 = sqrt(lifeExp)) # log e raiz quadrada


# A função summarise nos ajuda no calculo de estatistica descritiva
summarise(gapminder, 
          media_lifeExp = mean(lifeExp), # media
          mediana_gdp = median(gdpPercap), # mediana
          desvio_pop = sd(pop), # desvio padrao
          total_paises = length(unique(country))) # total de paises

# limpar ambiente

rm(list = ls())

