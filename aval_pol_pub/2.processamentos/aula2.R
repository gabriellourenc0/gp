
# Pacptes
#install.packages("plotly")
library(tidyverse)
library(rio)
library(here)
library(gapminder)
library(plotly)

#-----------
# Processar
#-----------

# Importar banco de dados da pasta 1.dados
dados <- import(here("1.dados/banco_gapminder.xlsx"))


dados %>%
  select(country,lifeExp) %>%
  filter(country=="South Africa"|
           country== "Brazil") %>%
  group_by(country) %>%
  summarise(Average_life = mean(lifeExp))

dados %>%
  select(country,lifeExp) %>%
  filter(country=="South Africa"|
           country== "Brazil" |
           country == "France") %>%
  group_by(country) %>%
  summarise(Average_life = mean(lifeExp))

#
dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=gdpPercap,y=lifeExp))

dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point()

dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col=continent))+
  geom_point()

dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col=continent))+
  geom_point(alpha=0.3)

dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp, col=continent))+
  geom_point(alpha=0.3)

# tendencias lineares
dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp, col=continent))+
  geom_point(alpha=0.8)+
  geom_smooth(method = lm)

# tendencias
dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp, col=continent))+
  geom_point(alpha=0.8)+
  geom_smooth()


#
dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp, col=continent))+
  geom_point(alpha=0.3)+
  geom_smooth(method = lm)+
  facet_wrap(~continent)

# por tamanho da pop
dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp, col=continent, size=pop))+
  geom_point(alpha=0.3)+
  geom_smooth(method = lm)+
  facet_wrap(~continent)

# cores por ano
dados %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp, col=year, size=pop))+
  geom_point(alpha=0.3)+
  geom_smooth(method = lm)+
  facet_wrap(~continent)

#####

p <- ggplot(data = dados,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "purple"))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()


p <- ggplot(data = dados, 
            mapping = aes(x = gdpPercap, y=lifeExp))

p + geom_point(alpha = 0.3) +
  geom_smooth(method = "gam") +
  scale_x_log10(labels = scales::dollar) +
  labs(x = "PIB per capita", y = "Expectativa de vida (anos)",
       title = "Crescimento Econômico e Expectativa de Vida",
       subtitle = "Tendência não-linear",
       caption = "Fonte: Gapminder")

# Salvar
ggsave('grafico01.png', bg='transparent', dpi = 100,
       width = 8, height = 5,
       path = "3.graficos")

#
p <- ggplot(data = dados, 
            mapping = aes(x = year, y = gdpPercap))

p + geom_line(color="gray70", aes(group = country)) +
  geom_smooth(size = 1.1, method = "loess", se = FALSE) +
  scale_y_log10(labels=scales::dollar) +
  facet_wrap(~ continent, ncol = 5) +
  labs(x = "Anos",
       y = "PIB Per Capita",
       title = "PIB Per Capita nos Cinco Continentes")

ggsave('grafico02.png', bg='transparent', dpi = 100,
       width = 8, height = 5,
       path = "3.graficos")

#----------------------------
# Grafico dinamico
#-----------------------------
gg <- ggplot(dados, aes(gdpPercap, lifeExp, color = continent)) +
  geom_point(aes(size = pop, frame = year, ids = country)) +
  scale_x_log10()

ggplotly(gg)

# limpar ambiente

rm(list = ls())
