#######################################
#
# Aula 4 - Regressao Linear
#
#######################################


#--------------------
#Exemplo:
#--------------------

x <- c(201,225,305,380,560,600,685,735)
y <- c(17,20,21,23,25,24,27,27)
dados = data.frame(x,y) #criando um data.frame
dados
is.data.frame(dados) #verifica se dados é um data.frame

plot(dados)

regressao=lm(y~x,data=dados) #ou apenas "regressão=lm(y~x)"
regressao
summary(regressao)

# O valor retornado por lm() é uma lista.
names(regressao)

regressao$fitted.values


# regressão$fitted.values ou predict(): calcula os valores preditos da variável
# resposta para cada elemento da amostra (faz uma previsão);

regressao

# regressão$residuals: calcula o erro ou os resíduos 
# (valor observado - valor predito) para cada ponto da amostra;
regressao$residuals

# E(erro) = 0 = media dos erros = 0
sum(regressao$residuals)

# regressão$coefficients: obtém uma estimativa dos coeficientes da regressão.
regressao$coefficients

#Exemplo:
plot(dados$x,dados$y)
abline(regressao)

# Outros componentes do ajuste são úteis para propósito de diagnóstico. Por exemplo,
# pode-se examinar o gráfico de valores ajustados contra resíduos:

# Linearidade
plot(regressao$fitted.values,regressao$residuals)
plot(regressao, which = 1)

# Este comando pode nos mostrar os desvios dos dados em relação ao modelo linear (estimado).

# histograma dos resíduos para verificar a presença de dados discrepantes (outliers)
hist(regressao$residuals)
plot(regressao, which = 2) # Quantile plot

######################
# Coeficiente de Correlação
######################

# 0 Nula
# 0 a 0,3 Fraca
# 0,3 a 0,7 Regular
# 0,7 a 0,99 Forte
# 1 Perfeita

# O coeficiente de correlação mede o grau de associação entre as variáveis dependente
# e independente (x e y). Seu valor varia de -1 (correlação negativa) a 1 (correlação positiva). 
# Existem as seguintes interpretações para o coeficiente de correlação:

cor(x,y)
cor(dados$x,dados$y)

###########################
# Coeficiente de Determinação
###########################

# Explica o grau de ajuste do modelo, ou o percentual de variação de y que é explicada
# pela variabilidade de x. Seu valor varia de 0 a 1.

cor(x,y)^2

summary(regressao)

# obs: beta/erro padrao = t-valor

0.015909/0.002066

###########################
# EXERCICO
###########################

# Para uma amostra de oito pessoas, foram coletados o número de
# horas de treinamento (x) e o tempo necessário para completar o trabalho (y). Os dados
# coletados encontram-se na tabela abaixo:

# a) Faça o gráfico de dispersão para esses dados.
# b) Determine o modelo de regressão linear simples entre as variáveis “x” e “y”.
# c) Em seguida, trace, no gráfico anterior, a reta de regressão.
# d) Calcule e intereprete os coeficientes de correlação (r) e determinação (r2).


y <- c(5.2,5.1,4.9,4.6,4.7,4.8,4.6,4.9)
x <- c(13,15,18,20,19,17,21,16)
y #apresentação do vetor y
x #apresentação do vetor x


plot(x,y)

mod_reg = lm(y~x)
mod_reg

abline(mod_reg)

# A reta sera: y=a +bx = y = 6.2261 -0.0792x

cor(x,y)

cor(y,x)^2

summary(mod_reg)

# Em outras palavras, 92% das variações em y são explicadas por variações em x.
# Os outros 8% possuem outras causas.



# limpar ambiente

rm(list = ls())








