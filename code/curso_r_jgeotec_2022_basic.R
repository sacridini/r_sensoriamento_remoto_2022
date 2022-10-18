# Vari?vel ----------------------------------------------------------------
a = 1

# Tipos de dados ----------------------------------------------------------
copa_do_mundo = 2022 # numeric
pi = 3.14 # numeric
nome = "Eduardo" # character (string)
v = TRUE # logical (TRUE, FALSE ou T, F)

# Operadores aritm?ticos --------------------------------------------------
soma = 5 + 5
subt = 5 - 5
div = 5 / 5
multi = 5 * 5
expo = 5 ^ 2
expo2 = 5 ** 2
índice = (5 - 2) / (423 + 10)

# Operadores relacionais/l?gicos ------------------------------------------
maior_que = 5 > 3
menor_que = 5 < 2
maior_ou_igual = 4 >= 2
menor_ou_igual = 2 <= 2
igual = 10 == 10
diferente = 5 != 10

# Sequ?ncias --------------------------------------------------------------
seq1 = 1:10
seq2 = seq(1:10)
seq3 = seq(0, 100, by = 10)

# Estruturas de dados (vetor) ---------------------------------------------
vetor_num = c(1,2,3,4,5)
vetor_bool = c(T,T,F)
vetor_char = c("A", "B", "C")
vetor_mix = c(1, "A", T)


# Estruturas de dados (matriz) --------------------------------------------
m1 = matrix(1:4, ncol = 2, nrow = 2)
m2 = matrix(1:4, ncol = 1, nrow = 4)
m3 = matrix(1:4, ncol = 4, nrow = 1)

# Estruturas de dados (lista) ---------------------------------------------
lista1 = list(c(1,2,3), "Ol?", 1:10)
lista1[[1]]
lista1[[2]]
lista1[[3]]
lista1[[4]]

# Estruturas de dados (data.frame) ----------------------------------------
df = data.frame(
  nome = c("Eduardo", "Carlos", "José"),
  idade = c(35, 42, 67)
)

df[1,1]
df[,2]

head(df)
is.data.frame(df)

# Condicionais (if, else) ----------------------------------------
# if (condition) {statement}
x = 5
y = 1

if (x < y) {
  print("x ? maior")
}

if (x < y) {
  print("x ? maior")
} else {
  print("x ? menor")
}

# For loop ----------------------------------------------------------------
for (valor in 1:5) {
  print(valor)
}

vec1 = c(1,2,3,4,5)
for (v in vec1) {
  print(v)
}

# Fun??es -----------------------------------------------------------------
# exemplo 1
say_my_name = function(nome) {
  print(nome)
}
say_my_name("Eduardo")

#exemplo 2
add = function(x, y) {
  resultado = x + y
  return(resultado)
}

add(2,2)

# Leitura de dados --------------------------------------------------------
library(dplyr)
data_url <- "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/data/gapminder_data.csv"
gapminder <- read.csv(data_url) # leitura dos dados
head(gapminder)
tail(gapminder)
names(gapminder)

glimpse(gapminder) # resumo
filter(gapminder, country == "Brazil" ) # filtra a tabela
brazil_2000 <- filter(gapminder, country == "Brazil" & year > 2000 ) # filtra a tabela
select(brazil_2000, country, year, lifeExp) # faz um subset na tabela
select(brazil_2000, -continent)
gapminder_new = mutate(gapminder, GDP = (gdpPercap * pop) / 1000000) # cria uma nova coluna
transmute(gapminder, GDP = (gdpPercap * pop) / 1000000) # faz a mesma coisa que o mutate mas mantém somente a coluna criada