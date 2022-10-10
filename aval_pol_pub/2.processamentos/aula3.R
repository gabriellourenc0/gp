##############################
#
# Aula 03 - Média e Teste t
#
##############################

# Simulaçao lançamento dado convergindo para o valor médio = 3.5 à medida que aumenta o
# tamanho da amostra

mean(sample(1:6, size = 1, replace = TRUE))
mean(sample(1:6, size = 2, replace = TRUE))
mean(sample(1:6, size = 5, replace = TRUE))
mean(sample(1:6, size = 10, replace = TRUE))
mean(sample(1:6, size = 50, replace = TRUE))
mean(sample(1:6, size = 100, replace = TRUE))
mean(sample(1:6, size = 1000, replace = TRUE))
mean(sample(1:6, size = 10000, replace = TRUE))
mean(sample(1:6, size = 1000000, replace = TRUE))


# Simulacao de dados com distribuicao normal, com media 0 e desvio 1.

set.seed(78) # define a semente da aleatoriedade
data <- rnorm(100)
mean(data)
t.test(data, mu=0) # test t 


#-------------------------------
# Teste z para duas proporções
#-------------------------------

# temos dois grupos de indivíduos:

# Grupo A, que é de esquerda: n = 500
# Grupo B, que é de direita: n = 500

A = 500
B = 500
# O número de pessoas a favor do Bolsa Família é o seguinte:
#   
#   Grupo A de esquerda: n = 500, 490 a favor do Bolsa Família:,

pA = 490/500

#   Grupo B, de direita: n = 500, 400 a favor do Bolsa Família, 

pB = 400/500 

# A proporção total de pessoas a favor do Bolsa Família é 

p = (490+400)/(500+500)
p
# A proporção geral de pessoas contra ao bolsa familia é 

q = 1 - p

# Será que essas duas prop são estatisticamente diferente?
resultado <- prop.test(x = c(490, 400), n = c(500, 500))
# Mostrando o resultado
resultado


# limpar ambiente

rm(list = ls())

