# Variável ----------------------------------------------------------------
a = 1

# Tipos de dados ----------------------------------------------------------
copa_do_mundo = 2022 # numeric
pi = 3.14 # numeric
nome = "Eduardo" # character (string)
v = TRUE # logical (TRUE, FALSE ou T, F)

# Operadores aritméticos --------------------------------------------------
soma = 5 + 5
subt = 5 - 5
div = 5 / 5
multi = 5 * 5
expo = 5 ^ 2
expo2 = 5 ** 2
índice = (5 - 2) / (423 + 10)

# Operadores relacionais/lógicos ------------------------------------------
maior_que = 5 > 3
menor_que = 5 < 2
maior_ou_igual = 4 >= 2
menor_ou_igual = 2 <= 2
igual = 10 == 10
diferente = 5 != 10

# Sequências --------------------------------------------------------------
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
lista1 = list(c(1,2,3), "Olá", 1:10)
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


# Condicionais (if, else) ----------------------------------------
# if (condition) {statement}
x = 5
y = 1

if (x < y) {
  print("x é maior")
}

if (x < y) {
  print("x é maior")
} else {
  print("x é menor")
}

# For loop ----------------------------------------------------------------
for (valor in 1:5) {
  print(valor)
}

vec1 = c(1,2,3,4,5)
for (v in vec1) {
  print(v)
}

# Funções -----------------------------------------------------------------
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