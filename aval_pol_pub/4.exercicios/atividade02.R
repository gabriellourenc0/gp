#############################################
#
# Exercicio 02 - Regressao
#
############################################


# Pacotes
library(tidyverse)
library(rio)
library(here)
library(gapminder)

#--------------------------
# Importar banco de dados
#--------------------------

dados <- import(here("1.dados/banco_gapminder.xlsx"))

# analisando o banco
table(dados$continent, dados$year)

# Bar plots para variavel discreta

ggplot(dados, aes(x=continent, fill=continent)) + geom_bar() +
  labs(y="Observações",
       x="Continente")

ggplot(dados, aes(x=continent, fill=continent)) + geom_bar() +
  labs(y="Observações",
       x="Continente") +
  coord_flip() # coord_flip inverte eixo


# density plots para variaveis continuas

ggplot(data=dados, aes(x=lifeExp)) + 
  geom_density()

# Por continente
ggplot(data=dados, aes(x=lifeExp, fill=continent)) +
  geom_density(alpha=0.5)


# boxplots
gap1 <- ggplot(data=dados, aes(x=continent, y=lifeExp, fill=continent))

gap1 +
  geom_boxplot(outlier.size=2)

# evolucao temporal
dados %>% 
  group_by(continent, year) %>%
  summarise(lifeExp=median(lifeExp)) %>%
  ggplot(aes(x=year, y=lifeExp, color=continent)) +
  geom_line(size=1) + 
  geom_point(size=1.5)


dados %>% 
  filter(country %in% c("Brazil", "United Kingdom","Zimbabwe")) %>% 
  ggplot(aes(x = year, y = lifeExp, colour = country)) + 
  geom_line(size=1) + 
  geom_point()

# grafico dinamico
library(plotly)
g <- crosstalk::SharedData$new(dados, ~ continent)
gg <- ggplot(g, aes(gdpPercap, lifeExp, color = continent, frame = year)) +
  geom_point(aes(size = pop, ids = country)) +
  geom_smooth(se = FALSE, method = "lm") +
  scale_x_log10()

ggplotly(gg) %>% 
  highlight("plotly_hover")

#-------------------
# Regressao linear
#-------------------

# Relacao entre expectativa de vida and Pib per capita

reg01 <- lm(lifeExp ~ gdpPercap, data=dados)
summary(reg01)

reg02 <- lm(lifeExp ~ gdpPercap + pop, data=dados)
summary(reg02)

reg03 <- lm(lifeExp ~ gdpPercap + pop + continent, data=dados)
summary(reg03)

# Ano de 2007
dados_2007 <- dados %>%
  filter(year==2007)

reg_gdp <- lm(gdpPercap ~ continent, data=dados_2007)
summary(reg_gdp)

# plot regressao
p <- ggplot(data = dados_2007,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point() +
  scale_x_log10() +  
  geom_smooth(method = "lm")  


# limpar ambiente
rm(list = ls())
