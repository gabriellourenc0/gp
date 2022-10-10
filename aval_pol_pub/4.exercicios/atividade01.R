#############################################
#
# Exercicio 01 - Teste t de media
#
############################################


# Pacotes
library(tidyverse)
library(rio)
library(here)
library(gapminder)

#-----------
# Processar
#-----------

# Importar banco de dados da pasta 1.dados
df <- import(here("1.dados/banco_gapminder.xlsx"))

#Calculate t-test 
df %>%
  select(lifeExp)%>% 
  t.test(mu=70)


df %>%
  filter(continent== "Europe") %>%  
  select(lifeExp)%>% 
  t.test(mu=70)


# t-test between the life expectancy  between two countries
df1 <- df %>% 
  select(continent,lifeExp) %>% 
  filter(continent == 'Europe' | continent == 'Asia') %>% 
  na.omit() # comando para excluir NA's (dados faltantantes)


t.test(data = df1, lifeExp ~ continent)

df1 <- df %>% 
  select(continent,lifeExp) %>% 
  filter(continent == 'Africa' | continent == 'Asia') %>% 
  na.omit()

t.test(data = df1, lifeExp ~ continent)


df1 <- df %>% 
  select(continent,lifeExp) %>% 
  filter(continent == 'Europe' | continent == 'Oceania') %>% 
  na.omit()

t.test(data = df1, lifeExp ~ continent)


# t-test between the life expectancy  between two countries
df1 <- df %>% 
  select(country,lifeExp) %>% 
  filter(country == 'Australia' | country == 'Germany') %>% 
  na.omit()

t.test(data = df1, lifeExp ~ country)


df1 <- df %>% 
  select(country,lifeExp) %>% 
  filter(country == 'Argentina' | country == 'Chile') %>% 
  na.omit()

t.test(data = df1, lifeExp ~ country)


df1 <- df %>% 
  select(country,lifeExp) %>% 
  filter(country == 'Brazil' | country == 'Germany') %>% 
  na.omit() 

t.test(data = df1, lifeExp ~ country)


df1 <- df %>% 
  select(country,lifeExp) %>% 
  filter(country == 'Brazil' | country == 'Argentina') %>% 
  na.omit() 

t.test(data = df1, lifeExp ~ country)


df1 <- df %>% 
  select(country,lifeExp) %>% 
  filter(country == 'Brazil' | country == 'Vietnam') %>% 
  na.omit() 

t.test(data = df1, lifeExp ~ country)



# t-test between the gdppercaptita between two countries
df2 <- df %>%
  select(country,gdpPercap) %>% 
  filter(country == 'United States' | country == 'Indonesia') %>% 
  na.omit() 

t.test(data = df2, gdpPercap ~ country)

#
df3 <- df %>%
  select(continent,gdpPercap) %>% 
  filter(continent == 'Africa' | continent == 'Europe') %>% 
  na.omit() 

t.test(data = df3, gdpPercap ~ continent)



# limpar ambiente

rm(list = ls())

